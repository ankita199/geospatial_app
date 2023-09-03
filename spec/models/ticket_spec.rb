# spec/models/ticket_spec.rb
require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it 'is valid with valid attributes' do
    ticket = FactoryBot.build(:ticket) # You can use FactoryBot for creating test data
    expect(ticket).to be_valid
  end

  it 'is invalid without a RequestNumber' do
    ticket = FactoryBot.build(:ticket, request_number: nil)
    expect(ticket).to_not be_valid
  end

  # Add more model validation tests here
end
