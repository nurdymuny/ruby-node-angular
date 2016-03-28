class PurchasesController < ApplicationController
  def create
  	a = Purchase.first || Purchase.new
  	a.update_attributes(purchase_field)
    redirect_to xml_format_purchase_path(a)
  end

  def update
    a  = Purchase.find(params[:id])
  	a.update_attributes(purchase_field)
    redirect_to xml_format_purchase_path(a)
  end

  def xml_format
    a  = Purchase.find(params[:id])
    @xml = a.xml_format
  end

  private
  def purchase_field
    params.require(:purchase).permit!
  end
end