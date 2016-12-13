class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
    @reservations = Reservation.find(params[:id])
  end

  def show
    @reservations = Reservation.all
  end

  def create
    if !!session[:user_id]
      reservation = Reservation.new
      reservation.user_id = session[:user_id]
      reservation.listing_id = params[:listing_id]

      if reservation.save
        render json: reservation
      end
    end
  end

end
