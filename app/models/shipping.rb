class Shipping
  include Mongoid::Document
  include Mongoid::Timestamps

   field :name, type: String
   field :street, type: String
   field :city, type: String
   field :state, type: String
   field :zip, type: String
   field :country, type: String

   belongs_to :purchase

end
