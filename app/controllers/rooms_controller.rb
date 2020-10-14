# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :authorize_request

  # GET /rooms
  # Get all rooms
  def index
    bookings = Room.all

    if bookings
      render json: { status: 'SUCCESS', message: 'Successfuly got all rooms', data: bookings }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end
end
