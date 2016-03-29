class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :partnumber, :type => String
  field :productname, :type => String
  field :quantity, :type => Float
  field :usdprice, :type => Float
  field :comment, :type => String
  field :shipdate, :type => DateTime

  belongs_to :purchase, autosave: true
end