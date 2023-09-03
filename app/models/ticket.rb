class Ticket < ApplicationRecord
  include RGeo::ActiveRecord::SpatialToPostGISSql
  has_one :excavator
end
