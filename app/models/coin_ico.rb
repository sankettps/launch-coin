class CoinIco < ApplicationRecord
	mount_uploader :coin_logo, CoinImageUploader
	mount_uploader :cover_photo, CoinImageUploader
	mount_uploader :white_paper, CoinDocUploader
  belongs_to :launcher
  has_many :comments, dependent: :destroy 
  has_many :ratings, dependent: :destroy
  def average_rating
	  ratings.sum(:score) / ratings.size
	end 
end
