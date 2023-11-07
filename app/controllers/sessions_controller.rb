# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
  request.session_options[:skip] = true

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id # Store the user's ID in the session
      render json: { message: 'User logged in successfully', username: user.name }
    else
      render json: { error: 'User not found' }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil # Clear the user's session (logout)
    render json: { message: 'User logged out successfully' }
  end
end
