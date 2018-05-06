class Comment < ApplicationRecord
  belongs_to :launcher
  belongs_to :coin_ico
  has_many :comment_replies, dependent: :destroy
  has_many :comment_likes, dependent: :destroy 

  def like_count
  	comment_likes.where(is_liked: true).count
  end
  def unlike_count
  	comment_likes.where(is_liked: false).count
  end
end
