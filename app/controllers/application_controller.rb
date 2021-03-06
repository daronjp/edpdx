class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  unless defined? LISTINGS
    LISTINGS = HTTParty.get("https://openapi.etsy.com/v2/shops/13283678/listings/active?api_key="+ENV['ETSY_API'])
  end

  unless defined? CATS
    CATS = Array.new
    LISTINGS['results'].each do |x|
      CATS.push(x['taxonomy_path'].last)
    end
    CATS = CATS.uniq
  end

  before_filter :no_bot

  private

  def no_bot
    if ['82.80.249.166', '82.80.230.228'].include? request.remote_ip
      redirect_to 'http://www.google.com'
    end
  end

  def gate_keeper
      if session[:visitor] == 'admin'
      # if current_visitor
      else

        # Galileo.create(:controller => 'gate_keeper',
        #                :view => 'unauthorized',
        #                :user_id => request.remote_ip,
        #                :session => request.session_options[:id])

        flash[:error] = "You must be logged in to access this section"
        redirect_to root_path
      end
    end

end
