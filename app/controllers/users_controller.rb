class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { error: 'That user already exists' }, status: :unprocessable_entity
    end
  end

  def index
    users = User.all
    render json: users, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
