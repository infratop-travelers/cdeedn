class ItemsController < ApplicationController
  def index
  	@items = Item.where(ready: true)
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = @item.cart_item.new
  end

  private
  def item_params
  	params.require(:item).permit(:image, :singer, :label, :genre, :name, :price, :stock, :delivery_status)
  end
end
