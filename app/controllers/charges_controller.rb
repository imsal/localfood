class ChargesController < ApplicationController
  # https://rails.devcamp.com/ruby-gem-walkthroughs/payment/how-to-integrate-stripe-payments-in-a-rails-application-charges

  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end




  # before_action :amount_to_be_charged
  # before_action :set_description
  #
  # def new
  # end
  #
  # def create
  # customer = StripeTool.create_customer(email: params[:stripeEmail],
  #                                       stripe_token: params[:stripeToken])
  #
  # charge = StripeTool.create_charge(customer_id: customer.id,
  #                                   amount: @amount,
  #                                   description: 'Rails Stripe customer')
  #
  # redirect_to thanks_path
  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to new_charge_path
  # end
  #
  # def thanks
  # end
  #
  # private
  #
  # def amount_to_be_charged
  #   @amount = 500
  # end
  #
  # def description
  #   @description = "Some amazing product"
  # end

end
