# frozen_string_literal: true

RSpec.describe 'Bookings TESTS', type: :request do
  before do
    ActionController::Base.allow_forgery_protection = true
  end

  let(:user) { build(:user) }
  let(:booking) { build(:booking) }
  let(:headers) { valid_headers.except(Authorization:"Token eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MDI0MjU5MTR9.j5j0gkjgfNUAY7aJeCL8mQIZkle9WypfcCT5KQt1wHg") }
  let(:valid_attributes) do
    {
      booking: {
        start_date: booking.start_date,
        end_date: booking.end_date,
        room_id: 1,
        user_id: 1
      }
    }
  end

  let(:invalid_attributes) do
    {
      booking: {
        start_date: ''
      }
    }
  end

  # User signup test suite
  describe 'POST /rooms/1/bookings' do
    context 'when valid request' do
      before { post '/rooms/1/bookings', params: valid_attributes.to_json, headers: headers }

      it 'creates a new booking' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Booking created/)
      end

    end

    context 'when invalid request' do
      before { post '/signup', params: invalid_attributes.to_json, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it '/rooms/1/bookings' do
        expect(json['message'])
          .to match(/Cannot create booking, date already booked/)
      end
    end
  end
    
  after do
    ActionController::Base.allow_forgery_protection = false
  end
end
