# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :model do
  it { should have_many(:participants) }
  it { should belong_to(:user) }
  it { should belong_to(:room) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:room_id) }
  it { should validate_presence_of(:user_id) }
end
