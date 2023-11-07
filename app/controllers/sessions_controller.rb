class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user
      render json: { message: 'User logged in successfully', username: user.name }
    else
      render json: { error: 'User not found' }, status: :unauthorized
    end
  end
end
