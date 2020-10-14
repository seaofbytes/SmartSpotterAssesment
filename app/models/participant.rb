# frozen_string_literal: true

class Participant < ApplicationRecord
  validates :booking_id, :invitee_id, presence: true

  belongs_to :booking, dependent: :destroy
  belongs_to :invitee, class_name: 'User', foreign_key: 'invitee_id'

  # Write your code here
end
