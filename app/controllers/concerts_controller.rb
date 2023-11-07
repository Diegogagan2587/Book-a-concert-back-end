class ConcertsController < ApplicationController
  def index
    @concerts = Concert.all
    render json: @concerts
  end

  def show
    @concert = Concert.find(params[:id])
    render json: @concert
  end
end
