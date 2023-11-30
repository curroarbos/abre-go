class PropertiesController < ApplicationController

  def index
    # @properties = Property..where(user_id: current_user.id)
  end

  def show
    @property = Property.find(params[:id])
    @recommendations = Recommendation.where(property_id: @property.id)
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:name, :location, :embedded_link)
  end
end
