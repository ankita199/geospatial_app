class TicketsController < ApplicationController
  before_action :find_ticket, only: [:show]

  def index
    @tickets = Ticket.includes(:excavator).all
  end

  def show
    if @ticket
      @geo_json = generate_geo_json(@ticket)
    else
      render_not_found
    end
  end

  private

  def find_ticket
    @ticket = Ticket.find_by_id(params[:id])
  end

  def generate_geo_json(ticket)
    return RGeo::GeoJSON.encode(RGeo::GeoJSON::Feature.new(ticket.well_known_text, nil, ticket.excavator_props))
  end

  def render_not_found
    render json: { error: 'Ticket not found' }, status: :not_found
  end
end
