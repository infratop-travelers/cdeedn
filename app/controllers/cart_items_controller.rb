class CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :signed_customer_redirect

  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = CartItem.new(cart_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.exists?(item_id: @cart_item.item_id)
      update_cart_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
      update_cart_item.count += @cart_item.count
      update_cart_item.update(count: update_cart_item.count)
    else
      @cart_item.save
    end
    redirect_to customer_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.delete
    redirect_to customer_cart_items_path(current_customer)
  end


  private
    def cart_params
      params.require(:cart_item).permit(:count, :item_id)
    end
end
