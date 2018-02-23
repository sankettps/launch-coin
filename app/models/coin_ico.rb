class CoinIco < ApplicationRecord
  has_many :comments, dependent: :destroy 
  belongs_to :launcher
end
