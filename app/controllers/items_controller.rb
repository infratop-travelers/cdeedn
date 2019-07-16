class ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  end

  private
  def item_params
  	params.require(:item).permit(:image, :singer, :label, :genre, :name, :price, :stock, :delivery_status)
  end
end
