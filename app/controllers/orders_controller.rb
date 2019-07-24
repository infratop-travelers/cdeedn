class OrdersController < ApplicationController
    def new
        @address = Address.new
        @cart_items = current_customer.cart_items.all
        @order_error = false
        @sum=0
        current_customer.cart_items.each do |cart|
            @sum += cart.item.price
        end
    end

    def create
        # もしも商品の在庫がなければredirect
        current_customer.cart_items.each do |cart|
            if cart.count > cart.item.stock
                @address = Address.new
                @cart_items = current_customer.cart_items.all
                @order_error = "購入分の在庫がありません"
                render ("orders/new")
                return
            end
        end

        # orderレコードを作る
        @order = Order.new
        @order.customer_id = current_customer.id
        @order.delivery_status = 0
        @order.sum = 0
        current_customer.cart_items.each do |cart|
            @order.sum += cart.item.price
        end
        @order.postage = 500
        @order.address = params[:address]
        @order.payment = params[:payment]
        @order.save

        # order_itemレコードを作る
        current_customer.cart_items.each do |cart|
            @order_item = OrderItem.new
            @order_item.item_id = cart.item.id
            @order_item.price = cart.item.price
            @order_item.count = cart.count
            @order_item.order_id = @order.id
            @order_item.save

            # 在庫から購入した分だけ引く
            item_stock = Item.find(cart.item_id).stock - cart.count
            Item.find(cart.item_id).update(stock: item_stock)

            # カートから商品を削除する
            cart.delete
            
        end

        redirect_to customer_path(current_customer)
    end

    def show
        @orders = current_customer.orders.all
    end

    def index
        @orders = current_customer.orders.all
    end
end
