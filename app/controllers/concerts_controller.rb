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
      render json: { message: 'Concert created successfully' }
    else
      render json: { errors: @concert.errors.full_messages }
    end
  end

  def current_user_concerts
    @current_user = User.find_by(logged: true)
    if @current_user
      @concerts = @current_user.concerts
      render json: @concerts
    else
      render json: { message: 'nobody has logged in, do that first to see the concerts' }
    end
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
