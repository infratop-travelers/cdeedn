class CartItemsController < ApplicationController
  def index

    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = CartItem.new(cart_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to customer_cart_items_path
  end

  def destroy
  end

  def confirm
  end

  private
    def cart_params
      params.require(:cart_item).permit(:count, :item_id)
    end
end
