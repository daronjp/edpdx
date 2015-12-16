class SessionsController < ApplicationController

  skip_before_filter :gate_keeper

  def new
  end

  def create
    visitor = Hq::User.authenticate(params[:username], params[:password])
    if visitor
      session[:visitor] = 'admin'

      # visitor.increment(:visit_count)
      # visitor.save
      # Galileo.create(:controller => 'session',
      #                :view => 'successful_login',
      #                :user_id => params[:group],
      #                :session => request.session_options[:id])
      # session[:visitor_id] = visitor.id
      # session[:visitor_group] = visitor.group
      flash[:notice] = "Welcome!"
      redirect_to :back
    else
      flash[:notice] = "Invalid password"
      redirect_to root_path
      # Galileo.create(:controller => 'session',
      #                :view => 'invalid_login',
      #                :user_id => params[:group],
      #                :session => params[:password])
    end
  end

  def destroy
    session[:visitor] = nil

    # Galileo.create(:controller => 'session',
    #                  :view => 'logout',
    #                  :user_id => session[:visitor_group],
    #                  :session => request.session_options[:id])

    redirect_to root_url, :notice => "Logged out!"
  end


end
