class Comment < ApplicationRecord
  belongs_to :launcher
  belongs_to :coin_ico
end
