class UserMailer < ApplicationMailer

  default from: 'support@edpdx.com'

    def welcome_email(cust)
      mail(to: cust.email, subject: 'Your purchase')
    end

    def purchase_email(cust, cart, total)
      @cust = cust
      @cart = cart
      @total = total
      @items = CartItem.where(:cart_id => @cart.id)
      mail(to: cust.email, subject: 'Your purchase from edpdx.com')
    end

    def shipment_email(cust, cart)
      @cust = cust
      @cart = cart
      @items = CartItem.where(:cart_id => @cart.id)
      mail(to: cust.email, subject: 'edpdx.com - Your purchase has shipped!')
    end

end
