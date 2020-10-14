# frozen_string_literal: true

class ParticipantsController < ApplicationController
  before_action :authorize_request

  # POST bookings/:booking_id/participants
  # Send an invite for a booking
  def create
    participant = Participant.create!(participant_params)
    if participant
      render json: { status: 'SUCCESS', message: 'Invite sent', data: participant }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Invite not sent' }, status: :unprocessable_entity
    end
  end

  private

  def participant_params
    params.require(
      :participant
    ).permit(
      :booking_id,
      :invitee_id
    )
  end
end
