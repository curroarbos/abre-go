class PropertiesController < ApplicationController

  def show
    # Have the user_id only
    @user = User.find(params[:id])
    @property = Property.where(user_id: @user.id).first
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
