# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_request, except: :create

  # POST /signup
  # return authenticated token upon signup
  def create
    # Check if email address contains "@evil-corp.com"
    # ends with?
    if user_params[:email].include? '@evil-corp.com'
      user = User.create!(user_params)
      auth_token = AuthenticateUser.new(user.email, user.password).call
      response = { message: Message.account_created, auth_token: auth_token }
      json_response(response, :created)
    else
      render json: { status: 'ERROR', message: 'You must register with a @evil-corp.com e-mail address' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(
      :user
    ).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
