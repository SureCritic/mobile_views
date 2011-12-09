class HomeController < ApplicationController
  has_mobile_views
  
  def index
    respond_to do |format|
      format.html
      format.mobile_html
    end
  end
end
