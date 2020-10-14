# frozen_string_literal: true

module Api
  module V1
    class BookingsController < ApplicationController
      # you can find these includes in controllers/concerns
      include Response
      include ExceptionHandler

      def index
        bookings = Booking.all
        json_response(bookings)
      end

      def show
        # Write your code here
      end

      def create
        # Write your code here
      end

      def update
        # Write your code here
      end

      def destroy
        # Write your code here
      end

      private

      def booking_params
        params.permit
        # Write your code here
      end
    end
  end
end
