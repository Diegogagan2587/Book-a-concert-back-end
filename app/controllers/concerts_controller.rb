class ConcertsController < ApplicationController
  def index
    @concerts = Concert.all
    render json: @concerts
  end
end
