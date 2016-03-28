class Purchase

  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :id, type: BSON::ObjectId
  field :PurchaseOrderNumber, type: String
  field :OrderDate, type: Date

  embeds_many :items, validate: true
  embeds_one :billing, validate: true
  embeds_one :shipping, validate: true

  accepts_nested_attributes_for :items
  accepts_nested_attributes_for :billing
  accepts_nested_attributes_for :shipping

end