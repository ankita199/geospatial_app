class TicketCreationService
  def initialize(json_data)
    @json_data = json_data
  end

  def create_ticket_and_excavator
    ticket = build_ticket
    excavator = build_excavator(ticket)
    if ticket.save && excavator.save
      { success: true, message: "Ticket and Excavator created successfully" }
    else
      { success: false, errors: ticket.errors.full_messages + excavator.errors.full_messages }
    end
  end

  private

  def build_ticket
    Ticket.new(
      request_number: @json_data["RequestNumber"],
      sequence_number: @json_data["SequenceNumber"],
      request_type: @json_data["RequestType"],
      request_action: @json_data["RequestAction"],
      response_due_date: DateTime.parse(@json_data["DateTimes"]["ResponseDueDateTime"]),
      sacode_primary: @json_data.dig("ServiceArea", "PrimaryServiceAreaCode", "SACode"),
      sacode_additional: Array(@json_data.dig("ServiceArea", "AdditionalServiceAreaCodes", "SACode")).join(","),
      well_known_text: @json_data.dig("ExcavationInfo", "DigsiteInfo", "WellKnownText")
    )
  end

  def build_excavator ticket
    excavator_data = @json_data["Excavator"]
    ticket.build_excavator(
      company_name: excavator_data["CompanyName"],
      address: excavator_data["Address"] + excavator_data["City"] + excavator_data["State"] + excavator_data["Zip"],
      crew_on_site: excavator_data["CrewOnsite"] == "true"
    )
  end
end
