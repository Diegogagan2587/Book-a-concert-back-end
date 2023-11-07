class ConcertsController < ApplicationController
  def index
    @concerts = Concert.all
    render json: @concerts
  end

  def show
    @concert = Concert.find(params[:id])
    render json: @concert
  end

  def create
    @concert = Concert.new(concert_params)

    if @concert.save
      render json: @concert, status: :created
    else
      render json: { errors: @concert.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def current_user_concerts
    @current_user = User.find_by(logged: true)
    @concerts = @current_user.concerts
    render json: @concerts
  end

  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy
    render json: { message: 'Concert deleted successfully' }
  end

  private

  def concert_params
    params.require(:concert).permit(:title, :organizer_id, :description, :img, :price, :date, :city)
  end
end
