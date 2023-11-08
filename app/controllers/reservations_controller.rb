class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: { message: 'Reservation created successfully' }
    else
      render json: { errors: @reservation.errors.full_messages }
    end
  end

  def current_user_reservations
    @current_user = User.find_by(logged: true)
    if @current_user
      @reservations = @current_user.reservations
      render json: @reservations
    else
      render json: { message: 'You are not logged in' }
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :concert_id, :date, :city)
  end
end
