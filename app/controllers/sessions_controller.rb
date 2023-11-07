class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user && user.logged == false
      User.find_by(name: user.name).update(logged: true)
      render json: { message: 'User logged in successfully', username: user.name }
    elsif user && user.logged == true
      render json: { error: 'User already logged in' }, status: :unprocessable_entity
    else
      render json: { error: 'User not found' }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(logged: true)
    user.update(logged: false)
    render json: { message: 'User logged out successfully' }
  end
end
