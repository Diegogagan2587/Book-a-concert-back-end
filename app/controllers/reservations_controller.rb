class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    reservations_hash = @reservations.as_json
    reservations_hash.each do |r|
      user_name = User.find(r['user_id']).name
      r['user_name'] = user_name
      concert_title = Concert.find(r['concert_id']).title
      r['concert_title'] = concert_title
    end
    render json: reservations_hash, status: :ok
  end

  def show
    @reservation = Reservation.find(params[:id])
    reservation_hash = @reservation.as_json
    user_name = User.find(reservation_hash['user_id']).name
    reservation_hash['user_name'] = user_name
    concert_title = Concert.find(reservation_hash['concert_id']).title
    reservation_hash['concert_title'] = concert_title
    render json: reservation_hash, status: :ok
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: { message: 'Reservation created successfully' }, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def current_user_reservations
    @current_user = User.find_by(logged: true)
    if @current_user
      @reservations = @current_user.reservations
      reservations_hash = @reservations.as_json
      reservations_hash.each do |r|
        user_name = User.find(r['user_id']).name
        r['user_name'] = user_name
        concert_title = Concert.find(r['concert_id']).title
        r['concert_title'] = concert_title
      end
      render json: reservations_hash, status: :ok
    else
      render json: { message: 'You are not logged in' }, status: :unauthorized
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :concert_id, :date, :city)
  end
end
