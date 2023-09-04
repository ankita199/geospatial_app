require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe 'GET #index' do
    it 'assigns @tickets with a list of tickets including excavators' do
      ticket1 = create(:ticket)
      ticket2 = create(:ticket)
      get :index

      expect(response).to have_http_status(:success)
      expect(assigns(:tickets)).to match_array([ticket1, ticket2])
    end
  end

  describe 'GET #show' do
    context 'when a ticket is found' do
      let(:ticket) { create(:ticket) }
      let(:excavator) { create(:excavator, ticket: ticket) }

      it 'assigns @ticket and generates geo_json' do
        excavator.inspect
        get :show, params: { id: ticket.id }

        expect(response).to have_http_status(:success)
        expect(assigns(:ticket)).to eq(ticket)
        expect(assigns(:geo_json)).not_to be_nil
      end
    end

    context 'when a ticket is not found' do
      it 'renders a "not found" response' do
        get :show, params: { id: 999 }
        expect(response).to have_http_status(:not_found)
        expect(response.body).to include('Ticket not found')
      end
    end
  end
end
