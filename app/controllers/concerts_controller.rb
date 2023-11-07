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

  private

  def concert_params
    params.require(:concert).permit(:title, :organizer_id, :description, :img, :price, :date, :city)
  end
end
