class PurchasesController < ApplicationController
  def create
    begin
    	a = Purchase.new
    	a.update_attributes(purchase_field)
      redirect_to xml_format_purchase_path(a)
    rescue
      redirect_to root_path
    end
  end

  def update
    begin
    a  = Purchase.find(params[:id])
  	a.update_attributes(purchase_field)
    redirect_to xml_format_purchase_path(a)
    rescue
      redirect_to root_path
    end
  end

  def xml_format
    begin
      a  = Purchase.find(params[:id])
      @xml = a.xml_format
    rescue
      @xml = nil
    end
  end

  private
  def purchase_field
    params.require(:purchase).permit!
  end
end