class ApplicationController < ActionController::API
  def current_user
    @current_user = User.find_by(logged: true)
    if @current_user.nil?
      render json: { message: 'No user logged in' }, status: :unauthorized
    else
      render json: @current_user, status: :ok
    end
  end
end
