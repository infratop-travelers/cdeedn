class Admin::CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        customer = Customer.find(params[:id])
        customer.update(customer_params)

        redirect_to admin_customer_path(customer)
    end

    private
        def customer_params
            params.require(:customer).permit(:first_name, :resd_first_name, :last_name, :read_last_name, :post_code, :prefecture, :city, :street, :phone_number, :email, :password)
        end

end
