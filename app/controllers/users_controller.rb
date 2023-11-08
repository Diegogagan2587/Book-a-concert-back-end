class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: { message: 'User created successfully' }
    else
      render json: { error: 'That user already exists' }
    end
  end

  def index
    users = User.all
    render json: users
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
