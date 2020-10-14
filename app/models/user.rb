# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates_presence_of :name, :email, :password, :password_digest

  has_many :bookings, dependent: :destroy
end
