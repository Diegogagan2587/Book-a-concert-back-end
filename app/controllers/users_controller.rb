class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: { message: 'User created successfully' }
    elsif user.errors[:name].include?('has already been taken')
      render json: { error: 'User with this name already exists' }, status: :unprocessable_entity
    else
      render json: { error: user.errors.full_messages.join(', ') }, status: :unprocessable_entity
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
