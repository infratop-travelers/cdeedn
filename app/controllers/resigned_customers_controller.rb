class ResignedCustomersController < ApplicationController
    def update
        customer = Customer.find(params[:customer_id])
        customer.update(resigned: true)

        resigned_customer = ResignedCustomer.new
        resigned_customer.customer_id = customer.id
        resigned_customer.save

        redirect_to new_customer_registration_path
    end
end
