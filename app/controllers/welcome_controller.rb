class WelcomeController < ApplicationController

  before_filter :meao

  def meao
    @cats = CATS
  end

  def index
    # @products = Product.joins(:photos).where("quantity > 0 and is_main = 't' and orientation = 'horizontal'").order("RANDOM()")
    unless session[:visitor] == 'admin'
      Galileo.create(:controller => 'welcome',
                       :view => 'index',
                       :ip => request.remote_ip,
                       :referrer => request.referer)
    end
    ## remove items from abandoned carts
    #  @carts = Cart.where("active = 't' and (extract(epoch from now()) - (extract(epoch from updated_at))) > 14400")
    #  @carts.each do |cart|
    #    cart.active = 'f'
    #    cart.save
    #    @cart_items = CartItem.where(:cart_id => cart.id)
    #    @cart_items.each do |item|
    #      Product.update(item.product.id, :quantity => item.product.quantity + item.quantity)
    #      item.delete
    #    end
    #  end
    @listings = LISTINGS
    @image = Hash.new
    @img = (0..@listings['results'].count-1).to_a.sample(3)
    l_id = Array.new
    @img.each do |x|
      l_id = @listings['results'][x]['listing_id'].to_s
      @image[l_id] = HTTParty.get("https://openapi.etsy.com/v2/listings/"+l_id+"/images?api_key="+ENV['ETSY_API'])
    end
    # @image = HTTParty.get("https://openapi.etsy.com/v2/listings/"+@listings['results'][0]['listing_id'].to_s+"/images?api_key="+ENV['ETSY_API'])

  end

  def about
  end

end
