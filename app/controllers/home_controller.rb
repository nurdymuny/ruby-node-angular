class HomeController < ApplicationController

  def edit
    @purchase = Purchase.first || Purchase.new
    @purchase.build_billing if @purchase.billing.nil?
    @purchase.build_shipping if @purchase.shipping.nil?
  end

  def xmlformat

  end
end