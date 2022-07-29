class TripsController < ApplicationController
  # before_action :authenticate_user

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
    @trip = Trip.new(
      user_id: current_user.id,
      name: params["name"],
    )

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
