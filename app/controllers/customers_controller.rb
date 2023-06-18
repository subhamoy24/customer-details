class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_url
    else
      render "new"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :dob, :gender)
  end
end
