class UsersController < ApplicationController
  #TODO: Add authenticable concern with tokenized security

  # POST /users
  #  params: {first_name: 'john', last_name: 'doe', email: 'john.doe@mail.com' }
  def create

    user = User.new(user_params)

    if user.save

      render json: user, status: :ok
    else

      render json: user.errors.full_messages, status: :bad_request
    end
  end

  # GET /users/1
  def show

    user = User.where(id: params[:id]).first

    if user.present?

      render json: user, status: :ok
    else

      render nothing: true, status: :not_found
    end
  end

  private

  def user_params

    params.permit(:first_name, :last_name, :email)
  end
end