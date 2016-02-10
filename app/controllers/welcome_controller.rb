class WelcomeController < ApplicationController
  def index
    @products = Product.joins(:photos).where("quantity > 0 and is_main = 't' and orientation = 'horizontal'").order("RANDOM()")
    unless session[:visitor] == 'admin'
      Galileo.create(:controller => 'welcome',
                       :view => 'index',
                       :ip => request.remote_ip)
    end

     @carts = Cart.where("active = 't' and (extract(epoch from now()) - (extract(epoch from updated_at))) > 43200")
     @carts.each do |cart|
       cart.active = 'f'
       cart.save
       @cart_items = CartItem.where(:cart_id => cart.id)
       @cart_items.each do |item|
         Product.update(item.product.id, :quantity => item.product.quantity + item.quantity)
       end
     end



  end
end
