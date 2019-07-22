class OrdersController < ApplicationController
    def new
        @cart_items = current_customer.cart_items.all
    end

    def create
        # もしも商品の在庫がなければredirect
        # orderレコードを作る
        @order = Order.new
        @order.customer_id = current_customer.id
        @order.delivery_status = 0
        @order.sum = 0
        current_customer.cart_items.each do |cart|
            @order.sum += cart.item.price
        end
        @order.postage = 500
        @order.address = current_customer.prefecture + current_customer.city + current_customer.street
        @order.payment = "unko"
        @order.save

        # order_itemレコードを作る
        current_customer.cart_items.each do |cart|
            @order_item = OrderItem.new
            @order_item.item_id = cart.item.id
            @order_item.price = cart.item.price
            @order_item.count = cart.count
            @order_item.order_id = @order.id
            @order_item.save

            # カートから商品を削除する
            cart.delete
        end

        redirect_to customer_path(current_customer)
    end

    def show
        @orders = current_customer.orders.all
    end
end
