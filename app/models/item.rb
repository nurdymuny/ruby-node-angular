class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :PartNumber, String
  field :ProductName, String
  field :Quantity, Float
  field :USPrice, Decimal
  field :Comment, Text
  field :ShipDate, DateTime

  belongs_to :purchase
end