class ProjectsController < ApplicationController

  def succulent
    unless session[:visitor] == 'admin'
      Galileo.create(:controller => 'project',
                       :view => 'succulent',
                       :ip => request.remote_ip,
                       :object => params[:id])
    end
  end

  def index
    unless session[:visitor] == 'admin'
      Galileo.create(:controller => 'project',
                       :view => 'index',
                       :ip => request.remote_ip,
                       :object => params[:id])
    end
  end

end
