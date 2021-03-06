class HomeController < ApplicationController

  def edit
    @purchase = Purchase.new
    @purchase.build_billing if @purchase.billing.nil?
    @purchase.build_shipping if @purchase.shipping.nil?
    @purchase.items.build if @purchase.items.empty?
    respond_to do |f|
      f.html
      f.json { @purchase.to_json(include: [:billing, :shipping, :items] ) }
      f.xml
    end
  end

  def xmlformat
    @purchase = (Purchase.first rescue nil) || Purchase.new
    @purchase.build_billing if @purchase.billing.nil?
    @purchase.build_shipping if @purchase.shipping.nil?
    @purchase.items.build if @purchase.items.empty?

    render json: @purchase.to_json(:include => [:billing, :shipping, :items]) 
   end
end