require 'active_support' #for to_xml() 'gem install activesupport' use the 2.3 branch
require 'json' #part of ruby 1.9 but otherwise 'gem install json'

class Purchase

  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :id, type: BSON::ObjectId
  field :purchaseordernumber, type: String
  field :orderdate, type: Date

  validates_presence_of :purchaseordernumber

  embeds_many :items,  class_name: 'Item'
  embeds_one :billing,  class_name: 'Billing'
  embeds_one :shipping,  class_name: 'Shipping'

  accepts_nested_attributes_for :items, :autosave => true
  accepts_nested_attributes_for :billing, :autosave => true
  accepts_nested_attributes_for :shipping, :autosave => true

  def xml_format
    my_json = self.to_json#(:include => [:billing, :shipping, :items]) 
    my_xml = JSON.parse(my_json).to_xml(:root => :purchase)
  end
end