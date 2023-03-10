class Post < ApplicationRecord
    extend FriendlyId
    validates :title, presence: true, length: {minimum:5, maximum:50}
    validates :body, presence: true
    belongs_to :user
    belongs_to :category

    #single image upload
    has_one_attached :image
    #many image upload
    #has_many_attached :images

    #after_destroy {notify admin of bad behavior}
    has_many :comments, dependent: :destroy

    has_rich_text :body

    has_noticed_notifications model_name: 'Notification'
    has_many :notifications, through: :user

    def self.ransackable_attributes(auth_object = nil)
        ["id","title", "body", "views"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["created_at", "updated_at"]
    end

    friendly_id :title, use: %i[slugged history finders] 

    def should_generate_new_friendly_id?
        title_changed? || slug.blank?
    end

    def views_by_day
        daily_events = Ahoy::Event.where("cast(properties ->> 'post_id' as bigint)=?", id)
        daily_events.group_by_day(:time).count
    end

    def self.total_views_by_day
        daily_events = Ahoy::Event.where(name: 'Viewed Post')
        daily_events.group_by_day(:time).count
    end
end