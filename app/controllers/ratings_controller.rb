class RatingsController < ApplicationController
  before_action :set_rating, only: [:update]
  before_action :authenticate_launcher!
	def update
		@rating.update_attributes(score: params[:score])
	end
	private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def rating_params
    #   params.require(:rating).permit(:launcher_id,:coin_ico_id,:score)
    # end
end
