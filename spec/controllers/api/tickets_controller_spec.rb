# spec/controllers/api/tickets_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::TicketsController, type: :controller do
  describe 'POST #create' do
    context 'with valid JSON data' do
      it 'creates a new ticket and excavator' do
        valid_json = (File.read("#{Rails.root.to_s}/spec/sample_file/valid_ticket.json"))

        expect {
          post :create, body: valid_json
        }.to change(Ticket, :count).by(1).and change(Excavator, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to eq('message' => 'Ticket and Excavator created successfully')
      end
    end

    context 'with invalid JSON data' do
      it 'returns an error message' do
        invalid_json   = (File.read("#{Rails.root.to_s}/spec/sample_file/invalid_ticket.json"))

        post :create, body: invalid_json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to have_key('errors')
      end
    end
  end
end
