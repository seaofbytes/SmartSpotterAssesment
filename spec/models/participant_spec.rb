# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Participant, type: :model do
  it { should validate_presence_of(:invitee_id) }
  it { should validate_presence_of(:room_id) }
end
