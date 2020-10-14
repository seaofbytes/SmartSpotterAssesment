# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    start_date { "2020-12-20T16:00Z" }
    end_date { "2020-12-25T16:00Z" }
    room { create(:room) }
    user { create(:user) }
  end
end
