class Post < ApplicationRecord
    extend FriendlyId
    validates :title, presence: true, length: {minimum:5, maximum:50}
    validates :body, presence: true
    belongs_to :user
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

end