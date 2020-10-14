# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'sandi@evil-corp.com' }
    password { 'kraska13' }
  end
end
