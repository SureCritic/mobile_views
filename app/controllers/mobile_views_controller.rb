module MobileViewsController
  
  module ClassMethods
  
    def has_mobile_views(args={})
      before_filter :has_mobile_views
    end
  
  end

  module InstanceMethods
    
    def mobile_device?
      if session[:mobile]
        session[:mobile] == "1"
      else
        request.user_agent =~ /Mobile|webOS/
      end
    end
  
    def has_mobile_views
      if request.subdomain != 'm' && mobile_device?
        if request.host =~ /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b|localhost/
          raise Exception, "Can't redirect to subdomain 'm.#{request.host}'! Please use e.g. lvh.me"
        else
          redirect_to request.protocol + "m." + request.host_with_port + request.fullpath
        end
      end
      session[:mobile] = params[:mobile] if params[:mobile]
      request.format = :mobile if mobile_device?
    end
  
  end
  
end