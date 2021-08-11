class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorise_user, only: [:edit, :update, :destroy]
  # before_action :set_user_listings, only: [:edit, :update, :destroy]
  before_action :set_form_vars, only: [:new, :edit]

  # GET /listings or /listings.json
  def index
    @listings = Listing.all.includes(:category)
  end

  # GET /listings/1 or /listings/1.json
  def show

  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    begin
      @listing.destroy
      respond_to do |format|
        format.html { redirect_to listings_url, notice: "This course was successfully deleted." }
        format.json { head :no_content }
      end
    rescue
      respond_to do |format|
        format.html { redirect_to listings_url, notice: "You are not authorized to delete sold item." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # def set_user_listings 
    #   @listing = current_user.listings.find_by_id(params[:id])
    #   if @listing == nil 
    #     flash[:error] = "You're not allowed to do that"
    #     redirect_to listings_path
    #   end 
    # end 

    def authorise_user
      if current_user.id != @listing.user_id
        flash[:error] = "You're not allowed to do that"
        redirect_to listings_path
      end 
    end 

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:user_id, :category_id, :title, :condition, :price, :description, :sold, :picture, feature_ids: [])
    end

    def set_form_vars
      @categories = Category.all
      @conditions = Listing.conditions.keys
      @features = Feature.all
    end 
end
