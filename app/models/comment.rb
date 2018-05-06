class Comment < ApplicationRecord
  belongs_to :launcher
  belongs_to :coin_ico
  has_many :comment_replies, dependent: :destroy
  has_many :comment_likes, dependent: :destroy 
end
