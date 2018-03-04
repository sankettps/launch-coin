class CoinIco < ApplicationRecord
  belongs_to :launcher
  has_many :comments, dependent: :destroy 
  has_many :ratings, dependent: :destroy
  def average_rating
	  ratings.sum(:score) / ratings.size
	end 
end
