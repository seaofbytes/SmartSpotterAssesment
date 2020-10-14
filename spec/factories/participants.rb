# frozen_string_literal: true

FactoryBot.define do
  factory :participant do
    booking { create(:booking) }
    invitee { create(:user) }
  end
end
