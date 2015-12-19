class WelcomeController < ApplicationController
  def index
    unless session[:visitor] == 'admin'
      Galileo.create(:controller => 'welcome',
                       :view => 'index',
                       :ip => request.remote_ip)
    end
  end
end
