class WelcomeController < ApplicationController
  def index
    @products = Product.joins(:photos).where("quantity > 0 and is_main = 't' and orientation = 'horizontal'")
    unless session[:visitor] == 'admin'
      Galileo.create(:controller => 'welcome',
                       :view => 'index',
                       :ip => request.remote_ip)
    end
  end
end
