# app/controllers/api/tickets_controller.rb
module Api
  class TicketsController < ApplicationController
    protect_from_forgery with: :null_session # Disable CSRF protection for simplicity in this example

    def create
      json_data = JSON.parse(request.body.read)

      ticket = Ticket.new(
        request_number: json_data["RequestNumber"],
        sequence_number: json_data["SequenceNumber"],
        request_type: json_data["RequestType"],
        request_action: json_data["RequestAction"],
        response_due_date: DateTime.parse(json_data["DateTimes"]["ResponseDueDateTime"]),
        sacode_primary: json_data["ServiceArea"]["PrimaryServiceAreaCode"]["SACode"],
        sacode_additional: json_data["ServiceArea"]["AdditionalServiceAreaCodes"]["SACode"].join(","),
        well_known_text: json_data["ExcavationInfo"]["DigsiteInfo"]["WellKnownText"]
      )

      excavator_data = json_data["Excavator"]
      excavator = ticket.build_excavator(
        company_name: excavator_data["CompanyName"],
        address: excavator_data["Address"],
        crew_on_site: excavator_data["CrewOnsite"] == "true"
      )

      if ticket.save && excavator.save
        render json: { message: "Ticket and Excavator created successfully" }, status: :created
      else
        render json: { errors: ticket.errors.full_messages + excavator.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
