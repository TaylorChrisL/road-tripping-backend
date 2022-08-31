class PlacesController < ApplicationController
  before_action :authenticate_user

  def create
    @place = Place.new(
      name: params["name"],
      trip_id: params["trip_id"],
      address: params["address"],
      city: params["city"],
      zip_code: params["zip_code"],
      longitude: params["longitude"],
      latitude: params["latitude"],
    )

    if @place.save
      render :show
    else
      render json: { errors: @place.errors.full_messages }, status: 406
    end
  end

  def update
    @place = Place.find_by(id: params["id"])
    @place.start_point = params["start_point"] || @place.start_point
    @place.end_point = params["end_point"] || @place.end_point

    if @place.save
      render template: "places/show"
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
