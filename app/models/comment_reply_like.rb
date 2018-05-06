class CommentReplyLike < ApplicationRecord
  belongs_to :launcher
  belongs_to :comment_reply
end
