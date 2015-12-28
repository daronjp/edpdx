class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = params[:cents]

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

    cust = Customer.create(
      :email => params[:stripeEmail],
      :given_name => params[:stripeShippingName],
      :address_1 => params[:stripeBillingAddressLine1],
      :city => params[:stripeShippingAddressCity],
      :state => params[:stripeShippingAddressState],
      :zip => params[:stripeShippingAddressZip]
    )

    cart = Cart.find(params[:cart_id])
    cart.active = 'f'
    cart.purchase = 't'
    cart.customer_id = cust.id
    cart.shipped = 'f'
    cart.save

    @items = CartItem.where(:cart_id => cart.id)

    total = params[:total]

    UserMailer.purchase_email(cust, cart, total).deliver_later

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :back
  end

end
