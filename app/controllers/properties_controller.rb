class PropertiesController < ApplicationController

  def show
    @property = Property.find(params[:id])
    @recommendations = Recommendations.where(property_id: @property.id)
  end

  def new
  end

  def create
  end
end
