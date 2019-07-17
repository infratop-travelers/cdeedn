class Admin::ResignedCustomersController < ApplicationController
    def create
        
    end

    def update
        customer = Customer.find(params[:id])
        customer.resigned = true
        customer.update(customer_params)

        resigned_customer = ResignedCustomer.new
        resigned_customer.customer_id = customer.id
        resigned_customer.save

        redirect_to admin_customers_path
    end

    def destroy
    
    end

    private
        def customer_params
            params.require(:customer).permit(:resigned)
        end
end
