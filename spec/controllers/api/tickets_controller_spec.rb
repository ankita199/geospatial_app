require 'rails_helper'

RSpec.describe Api::TicketsController, type: :controller do
  describe 'POST #create' do
    context 'with valid JSON data' do
      it 'creates a ticket and excavator' do
        valid_json = (File.read("#{Rails.root.to_s}/spec/sample_file/valid_ticket.json"))

        post :create, body: valid_json, format: :json

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include('message' => 'Ticket and Excavator created successfully')
      end
    end

    context 'with invalid JSON data' do
      it 'returns unprocessable entity status' do
        invalid_json   = (File.read("#{Rails.root.to_s}/spec/sample_file/invalid_ticket.json"))

        post :create, body: invalid_json, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)["errors"]).to eq("Invalid JSON data")
      end
    end

    context 'with missing JSON data' do
      it 'returns unprocessable entity status' do
        post :create, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to include('errors')
      end
    end
  end
end
