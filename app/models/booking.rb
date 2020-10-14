# frozen_string_literal: true

class Booking < ApplicationRecord
  validates :start_date, :end_date, :room_id, :user_id, presence: true
  
  has_many :participants
  belongs_to :user
  belongs_to :room

end
