class CommentReply < ApplicationRecord
  belongs_to :launcher
  belongs_to :comment
  has_many :comment_reply_likes, dependent: :destroy 
end
