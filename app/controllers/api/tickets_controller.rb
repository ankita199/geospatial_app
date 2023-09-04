require 'json-schema'
module Api
  class TicketsController < ApplicationController
    before_action :parse_json_data, only: [:create]

    def create
      unless valid_json_data?
        render json: { errors: 'Invalid JSON data' }, status: :unprocessable_entity
        return
      end

      service = TicketCreationService.new(@json_data)
      result = service.create_ticket_and_excavator

      if result[:success]
        render json: { message: result[:message] }, status: :created
      else
        render json: { errors: result[:errors] }, status: :unprocessable_entity
      end
    end

    private

    def parse_json_data
      begin
        @json_data = JSON.parse(request.body.read) rescue {}
      rescue Exception => e
        @json_data = {}
      end
    end

    def valid_json_data?
      JSON::Validator.validate(json_schema, @json_data)
    end

    def json_schema
      JSON.parse(File.read('config/schemas/geospatial.json'))
    end
  end
end
