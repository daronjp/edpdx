class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

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
