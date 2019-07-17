class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new(item_params)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "successfully"
      redirect_to admin_item_path(@item)
    else
      flash[:notice] = "error"
      redirect_to admin_items_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      flash[:notice] = "successfully"
      redirect_to admin_item_path(@item)
    else
      flash[:notice] = "error"
      redirect_to edit_admin_item_path(@item)
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :singer, :label, :genre, :name, :price, :stock, :delivery_status)
  end
end
