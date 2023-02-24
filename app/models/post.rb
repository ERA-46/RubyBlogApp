class Post < ApplicationRecord
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
end