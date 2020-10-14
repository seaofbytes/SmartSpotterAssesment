# frozen_string_literal: true

require 'rails_helper'

FactoryBot.factories.map(&:name).each do |factory|
  describe "The #{factory} factory" do
    it 'is valid' do
      build(factory).should be_valid
    end
  end
end
