class CommentLike < ApplicationRecord
  belongs_to :launcher
  belongs_to :comment
end
