class PlacesController < ApplicationController
    before_action :authenticate_user!, :only => [:new, :create, :update, :destroy]
    before_action :authorize, :only => [:edit]
	def index
		@places = Place.all
	end

	def new
		@place = Place.new
  end

  def create
     @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :new, :status => :unprocessable_entity
  end
    end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to root_path
  end

  def show
      @place = Place.find(params[:id])
      @comment = Comment.new
      @photo = Photo.new
  end

  def edit
      @place = Place.find(params[:id])
  end

  def update
     @place = Place.find(params[:id])

    if @place.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end

    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :edit, :status => :unprocessable_entity
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

  def authorize
    p @place = Place.find(params[:id])
    unless @place.user == current_user
    redirect_to root_path
    end
  end

end
