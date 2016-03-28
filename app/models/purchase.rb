require 'active_support' #for to_xml() 'gem install activesupport' use the 2.3 branch
require 'json' #part of ruby 1.9 but otherwise 'gem install json'

class Purchase

  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :id, type: BSON::ObjectId
  field :purchaseordernumber, type: String
  field :orderdate, type: Date

  embeds_many :items, validate: true, class_name: 'Item'
  embeds_one :billing, validate: true, class_name: 'Billing'
  embeds_one :shipping, validate: true, class_name: 'Shipping'

  accepts_nested_attributes_for :items, :autosave => true
  accepts_nested_attributes_for :billing, :autosave => true
  accepts_nested_attributes_for :shipping, :autosave => true

  def xml_format
    my_json = self.to_json(:include => [:billing, :shipping, :items]) 
    my_xml = JSON.parse(my_json).to_xml(:root => :my_root)
  end
end