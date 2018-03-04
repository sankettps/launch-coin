class Rating < ApplicationRecord
  belongs_to :coin_ico
  belongs_to :launcher
end
