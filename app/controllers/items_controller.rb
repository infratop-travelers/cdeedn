class ItemsController < ApplicationController
  before_action :signed_customer_redirect
  
  def index
  	@items = Item.where(ready: true).reverse
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = @item.cart_item.new
    if customer_signed_in?
      @exist = @item.favorites.where(customer_id: current_customer.id).exists?
    end
  end

  private
  def item_params
  	params.require(:item).permit(:image, :singer, :label, :genre, :name, :price, :stock, :delivery_status)
  end
end
