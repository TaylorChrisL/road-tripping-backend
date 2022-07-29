class PlacesController < ApplicationController
  before_action :authenticate_user

  def create
    @place = Place.new(
      name: params["name"],
      place_id: params["place_id"],

    )

    if @place.save
      render :show
    else
      render json: { errors: @place.errors.full_messages }, status: 406
    end
  end

  def destroy
    place = Place.find_by(id: params["id"])
    place.destroy

    render json: { message: "Place has been removed from your trip" }
  end
end
