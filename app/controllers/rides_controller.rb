class RidesController < ApplicationController
  def new
  end

  def create
    @ride = current_user.rides.build(attraction_id: params[:attraction_id])
    @ride.save
    redirect_to user_path(@ride.user), notice: @ride.take_ride
  end
end
