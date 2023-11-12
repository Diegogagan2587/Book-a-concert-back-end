class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])

    if user
      User.update_all(logged: false) # Log out all users
      user.update(logged: true) # Log in the current user
      render json: { message: "#{user.name} logged in successfully" }, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def destroy
    user = User.find_by(logged: true)
    if user
      User.update_all(logged: false) # Log out all users
      render json: { message: 'User logged out successfully' }, status: :ok
    else
      render json: { error: 'No user is currently logged in' }, status: :not_found
    end
  end
end
