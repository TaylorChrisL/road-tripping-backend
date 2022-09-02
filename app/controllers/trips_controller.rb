class TripsController < ApplicationController
  before_action :authenticate_user

  def index
    @trips = current_user.trips
    render :index
  end

  def show
    @trip = Trip.find_by(id: params["id"])

    if current_user.id == @trip.user_id
      render :show
    else
      render json: { message: "You do not have access to this trip" }, status: 406
    end
  end

  def create
    user_trip = UserTrip.new(user_id: current_user.id, owner: true)
    @trip = Trip.new(
      name: params["name"],
    )
    user_trip[:trip_id] = @trip.id

    user_trip.save
    if @trip.save
      render :show
    else
      render json: { errors: @trip.errors.full_messages }, status: 406
    end
  end

  def update
    @trip = Trip.find_by(id: params["id"])

    @trip.name = params["name"] || @trip.name

    if @trip.save
      render :show
    else
      render json: { errors: @trip.errors.full_messages }, status: 406
    end
  end
end
