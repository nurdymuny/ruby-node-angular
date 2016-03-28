class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :id, type: BSON::ObjectId
  field :email, type: String
end
