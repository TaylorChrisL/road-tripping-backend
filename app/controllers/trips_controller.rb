class TripsController < ApplicationController
  def index
    @trips = current_user.trips
    render :index
  end

  def show
    @trip = Trip.find_by(id: params["id"])

    if current_user.id = @trip.user_id
      render :show
    else
      render json: { message: "You do not have access to this trip" }, status: 406
    end
  end

  def create
    @trip = Trip.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
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
    @trip.price = params["price"] || @trip.price
    @trip.description = params["description"] || @trip.description

    if @trip.save
      render :show
    else
      render json: { errors: @trip.errors.full_messages }, status: 406
    end
  end
end
