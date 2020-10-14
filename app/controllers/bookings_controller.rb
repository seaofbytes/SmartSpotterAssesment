# frozen_string_literal: true
class BookingsController < ApplicationController
  before_action :authorize_request, except: :index

  # GET /bookings
  # Get all bookings
  def index
    bookings = Booking.all

    if bookings
      render json: { status: 'SUCCESS', message: 'Successfuly got all bookings', data: bookings }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end

  # POST /rooms/:room_id/bookings
  # Create booking
  def create
    # Check for dates/times overlapping
    puts current_user[:id], "CURRENT USER"
    overlap = Booking.where('end_date > ? AND start_date < ?', booking_params[:start_date], booking_params[:end_date])

    # If room is free, create booking
    if overlap.length.zero? 
      booking = Booking.create!(booking_params)
      render json: { status: 'SUCCESS', message: 'Booking created', data: booking }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Cannot create booking, date already booked' }, status: :unprocessable_entity
    end
  end

  # PATCH bookings/:id
  # Update booking
  def update
    booking = Booking.find(params[:id])
    
    # Check if user is the owner of the booking
    if current_user[:id] == booking[:user_id]
      if booking.update_attributes(booking_params) 
        render json: { status: 'SUCCESS', message: 'Updated booking', data: booking }, status: :ok
      else
        render json: { status: 'ERROR', message: 'Booking not updated', data: booking.errors }, status: :unprocessable_entity
      end
    end
  end

  # DELETE bookings/:id
  # Delete booking
  def destroy
    booking = Booking.find(params[:id])

    # Check if user is the owner of the booking
    if current_user[:id] == booking[:user_id]
      if booking.destroy
        render json: { status: 'SUCCESS', message: 'Deleted booking', data: booking }, status: :ok
      else
        render json: { status: 'FAILURE', message: 'Something went wrong' }, status: :unprocessable_entity
      end
    end
  end

  private

  def booking_params
    params.require(
      :booking
    ).permit(
      :start_date,
      :end_date,
      :user_id,
      :room_id
    )
  end
end
