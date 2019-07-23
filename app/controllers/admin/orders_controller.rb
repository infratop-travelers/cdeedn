class Admin::OrdersController < ApplicationController
    def index
        @orders = Order.all
        @orders_undispatched = @orders.where(delivery_status: 0)
        @orders_sent = @orders.where(delivery_status: 1)
        @orders_delivered = @orders.where(delivery_status: 2)
    end

    def show
        @order = Order.find(params[:id])
    end

    def update
        @order = Order.find(params[:id])
        if @order.delivery_status == 0
            @order.update(delivery_status: 1)
        else
            @order.update(delivery_status: 2)
        end
        redirect_to admin_orders_path
    end
end
