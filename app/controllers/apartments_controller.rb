class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :map_location]

  # GET /apartments
  # GET /apartments.json
  def index
    if params[:search].nil?
      @apartments = Apartment.all
    else
      @user_search = params[:search]
      @apartments = Apartment.search(@user_search)
    end

    @pindrop = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
      marker.lat apartment.latitude
      marker.lng apartment.longitude
      marker.infowindow '<a href="/apartments/' + apartment.id.to_s + '"/>' + apartment.full_address + '</a>'
    end
  end

  def map_location
    @apartment = Apartment.find(params[:apartment_id])
    @hash = Gmaps4rails.build_markers(@apartment) do |apartment, marker|
      marker.lat apartment.latitude
      marker.lng apartment.longitude
      marker.infowindow apartment.full_address
    end
    render json: @hash.to_json
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
    @apartments = Apartment.find(params[:id]) #@apartments may also be found using the set_apartment method provided by scaffolding
    @pindrop = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
      marker.lat(apartment.latitude)
      marker.lng apartment.longitude
      marker.infowindow apartment.full_address
    end
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
    @users_for_select = User.all.map do |user|
      [user.name, user.id]
    end
  end

  # GET /apartments/1/edit
  def edit
    @users_for_select = User.all.map do |user|
      [user.name, user.id]
    end
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)
    @users_for_select = User.all.map do |user|
      [user.name, user.id]
    end

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    @users_for_select = User.all.map do |user|
      [user.name, user.id]
    end

    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:address1, :address2, :city, :postalcode, :state, :country, :user_id, :image, :description, :phone, :time)
    end
end
