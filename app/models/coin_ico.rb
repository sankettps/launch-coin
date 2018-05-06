class CoinIco < ApplicationRecord
	serialize :accepts, Array
	mount_uploader :coin_logo, CoinImageUploader
	mount_uploader :cover_photo, CoinImageUploader
	mount_uploader :white_paper, CoinDocUploader
  belongs_to :launcher
  has_many :comments, dependent: :destroy 
  has_many :ratings, dependent: :destroy
  has_many :favourite_icos, dependent: :destroy 
  def average_rating
	  ratings.sum(:score) / ratings.size rescue 0
	end 

	def current_round_time
		# CoinIco.last.rounds.each do |key,round|
		rounds.each do |key,round|
			# round = JSON.parse(round)
			round = eval(round)
			start_date = round["start_date"].to_datetime
			end_date = round["end_date"].to_datetime
			if start_date < Time.now && end_date > Time.now
				return end_date.to_i - Time.now.to_i
			elsif start_date > Time.now
				return start_date.to_i - Time.now.to_i
			end
		end
		return 0 
	end

	def rounds_with_status
		all_rounds = {}
		rounds.each do |key,round|
			single_round = {}
			round = eval(round)
			start_date = round["start_date"].to_datetime
			end_date = round["end_date"].to_datetime
			single_round["start_date"] = start_date.strftime("%d/%m/%Y")
			single_round["end_date"] = end_date.strftime("%d/%m/%Y")
			if start_date < Time.now && end_date > Time.now
				single_round["status"] = "Active"
				#running
			elsif start_date > Time.now
				single_round["status"] = "Pending"
				#pending
			elsif start_date < Time.now
				single_round["status"] = "Completed"
				#completed
			end
			all_rounds[key] = single_round
		end
		return all_rounds 
	end
end
