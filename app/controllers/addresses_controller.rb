class AddressesController < ApplicationController

  before_action :signed_customer_redirect
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to new_customer_order_path(current_customer)
    else
      @address_error = "住所登録のエラーです"
      @cart_items = current_customer.cart_items.all
      @order_error = false
      @sum=0
      current_customer.cart_items.each do |cart|
          @sum += cart.item.price
      end
      render ("orders/new")
    end 
  end

  def destroy
    @address = Address.find(params[:id])
    @address.delete
    redirect_to new_customer_order_path(current_customer)
  end

  private
    def address_params
      params.require(:address).permit(:post_code,:prefecture,:city,:street)
    end
end
