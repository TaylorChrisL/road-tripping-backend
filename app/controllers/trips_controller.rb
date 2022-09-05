class TripsController < ApplicationController
  before_action :authenticate_user

  def index
    @trips = current_user.trips
    render :index
  end

  def show
    @trip = Trip.find_by(id: params["id"])

    if @trip.users.includes(current_user)
      render :show
    else
      render json: { message: "You do not have access to this trip" }, status: 406
    end
  end

  def create
    @trip = Trip.new(
      name: params[:name],
      owner_id: current_user.id,
    )

    if @trip.save
      user_trip = UserTrip.new(user_id: current_user.id, trip_id: @trip.id)
      user_trip.save
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
