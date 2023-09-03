class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :request_number
      t.string :sequence_number
      t.string :request_type
      t.string :request_action
      t.datetime :response_due_date
      t.string :sacode_primary
      t.string :sacode_additional
      t.geometry :well_known_text, geographic: true

      t.timestamps
    end
  end
end
