class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def top
  end
end
