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
    if params["start_point"] == "true"
      @place.start_point = true
    elsif params["start_point"] == "false"
      @place.start_point = false
    end
    if params["end_point"] == "true"
      @place.end_point = true
    elsif params["end_point"] == "false"
      @place.end_point = false
    end

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
