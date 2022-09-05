class UserTripsController < ApplicationController
  def create
    user = User.find_by(email: params["email"])
    trip = Trip.find_by(id: params["trip_id"])

    @user_trip = UserTrip.new(
      user_id: user.id,
      trip_id: trip.id,
    )

    if @user_trip.save
      render json: @user_trip
    else
      render json: { errors: @user_trip.errors.full_messages }, status: 406
    end
  end
end
