class CommentReply < ApplicationRecord
  belongs_to :launcher
  belongs_to :comment
  has_many :comment_reply_likes, dependent: :destroy 

  def like_count
  	comment_reply_likes.where(is_liked: true).count
  end
  def unlike_count
  	comment_reply_likes.where(is_liked: false).count
  end
end
