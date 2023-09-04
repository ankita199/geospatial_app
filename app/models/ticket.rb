class Ticket < ApplicationRecord
  has_one :excavator

  def excavator_props
    { 
      name: excavator.company_name, 
      address: excavator.address 
    }
  end
end
