class CoinIcosController < ApplicationController
  before_action :authenticate_launcher!, except: [:index,:show]
  before_action :set_coin_ico, only: [:show, :edit, :update, :destroy]

  # GET /coin_icos
  # GET /coin_icos.json
  def index
    @coin_icos = CoinIco.where(is_approved: true).order("created_at desc")
  end

  # GET /coin_icos/1
  # GET /coin_icos/1.json
  def show
    if current_launcher
      @comment = @coin_ico.comments.build(launcher_id:current_launcher.id) 
      @rating = Rating.where(coin_ico_id: @coin_ico.id, launcher_id: @current_launcher.id).first
      unless @rating
        @rating = Rating.create(coin_ico_id: @coin_ico.id, launcher_id: @current_launcher.id, score: 0)
      end
      puts "-------#{@rating.errors.inspect}-----------"
    end
  end

  # GET /coin_icos/new
  def new
    @coin_ico = CoinIco.new
  end

  # GET /coin_icos/1/edit
  def edit
  end

  # POST /coin_icos
  # POST /coin_icos.json
  def create
    @coin_ico = CoinIco.new(coin_ico_params)

    respond_to do |format|
      if @coin_ico.save
        format.html { redirect_to coin_icos_path, notice: 'Coin ico was successfully created.' }
        format.json { render :show, status: :created, location: @coin_ico }
      else
        format.html { render :new }
        format.json { render json: @coin_ico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coin_icos/1
  # PATCH/PUT /coin_icos/1.json
  def update
    respond_to do |format|
      if @coin_ico.update(coin_ico_params)
        format.html { redirect_to coin_icos_path, notice: 'Coin ico was successfully updated.' }
        format.json { render :show, status: :ok, location: @coin_ico }
      else
        format.html { render :edit }
        format.json { render json: @coin_ico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coin_icos/1
  # DELETE /coin_icos/1.json
  def destroy
    @coin_ico.destroy
    respond_to do |format|
      format.html { redirect_to coin_icos_url, notice: 'Coin ico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def launcher_coin_icos
    # @coin_icos = current_launcher.coin_icos.order("created_at desc")
    @coin_icos = current_launcher.favourite_coin_icos.order("created_at desc")
  end

  def favourite_ico
    # current_launcher.favourite_icos.create_with(coin_ico_id: params[:ico_id],is_favourite: true).find_or_create_by(coin_ico_id: params[:ico_id])
    current_launcher.favourite_icos.create(coin_ico_id: params[:ico_id],is_favourite: true)
    redirect_to coin_ico_path(params[:ico_id])
  end

  def unfavourite_ico
    @fav_ico  = current_launcher.favourite_icos.find_by(coin_ico_id: params[:ico_id])
    if @fav_ico.present?
      @fav_ico.destroy
    end
    redirect_to coin_ico_path(params[:ico_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin_ico
      @coin_ico = CoinIco.find_by_id(params[:id])
      redirect_to root_path unless @coin_ico.present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coin_ico_params
      params.require(:coin_ico).permit(:launcher_id,:description,:coin_name,:rate,:total_supply,:website,:presentation_link,:facebook_link,:twitter_link,:telegram_link,:coin_logo,:cover_photo,:white_paper,:country,:accepts,:token_symbol,{rounds: {}})
    
    end
end
