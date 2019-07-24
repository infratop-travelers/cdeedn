class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!
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
        @customer = Customer.find(params[:id])
        p @customer
        if @customer.update(customer_params)
            redirect_to admin_customer_path(@customer), notice: '情報の更新が成功しました'
        else
            @customer_error = "ユーザー編集でのエラーです"
            render("admin/customers/edit")
        end    
        
    end

    

    private
        def customer_params
            params.require(:customer).permit(:first_name, :read_first_name, :last_name, :read_last_name, :post_code, :prefecture, :city, :street, :phone_number, :email, :password)
        end

end
