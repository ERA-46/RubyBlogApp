class Comment < ApplicationRecord
  #add counter cache to avoid hitting db to get the counter of the comments
  belongs_to :post, counter_cache: true
  belongs_to :user
  has_rich_text :body

  after_create_commit :notify_recipientext
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private

  def notify_recipientext
    CommentNotification.with(comment: self, post: post).deliver_later(post.user)

  end

  def cleanup_notifications
    notifications_as_comment.destroy_all
  end

end
