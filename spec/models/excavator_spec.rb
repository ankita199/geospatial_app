# spec/models/excavator_spec.rb
require 'rails_helper'

RSpec.describe Excavator, type: :model do
  it 'is valid with valid attributes' do
    excavator = FactoryBot.build(:excavator) # You can use FactoryBot for creating test data
    expect(excavator).to be_valid
  end

  it 'is invalid without a CompanyName' do
    excavator = FactoryBot.build(:excavator, company_name: nil)
    expect(excavator).to_not be_valid
  end

  # Add more model validation tests here
end
