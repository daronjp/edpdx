class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :no_bot

  private

  def no_bot
    if request.remote_ip == '82.80.249.166'
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
