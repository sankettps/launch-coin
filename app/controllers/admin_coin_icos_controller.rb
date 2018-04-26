class AdminCoinIcosController < ApplicationController
	before_action :authenticate_launcher!
  before_action :authorize_launcher

  def index
  	@approved_icos = CoinIco.where(is_approved: true).order("created_at desc")
  	@declined_icos = CoinIco.where(is_approved: false).order("created_at desc")
  	@coin_icos = CoinIco.where(is_approved: nil).order("created_at desc")
  end

  def approve_ico
    @coin_ico = CoinIco.find_by_id(params[:id])
    if @coin_ico.update_attributes(is_approved: true)
    	flash[:notice]="Ico approved sucessfully"
    else
    	flash[:error]="Ico not approved please contact to admin"
    end
    redirect_to admin_coin_icos_path
  end

  def decline_ico
    @coin_ico = CoinIco.find_by_id(params[:id])
    if @coin_ico.update_attributes(is_approved: false)
    	flash[:notice]="Ico declined sucessfully"
    else
    	flash[:error]="Ico not declined please contact to admin"
    end
    redirect_to admin_coin_icos_path
  end

  private
  	def authorize_launcher
  		redirect_to root_path unless current_launcher.email == "icototes@gmail.com"
  	end
end
