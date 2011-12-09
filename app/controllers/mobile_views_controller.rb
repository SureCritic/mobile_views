module MobileViewsController
  
  module ClassMethods
  
    def has_mobile_views(args={})
      class_eval do
        before_filter :has_mobile_views
      end
    end
  
  end

  module InstanceMethods
  
    def has_mobile_views
      if request.subdomain == 'm'
        request.format = :mobile_html
      elsif request.user_agent =~ /Mobile|webOS|iPhone|iOS|Android/
        if request.host =~ /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b|localhost/
          raise Exception, "Can't redirect to subdomain 'm.#{request.host}'! Please use e.g. lvh.me"
        else
          redirect_to request.protocol + "m." + request.host_with_port + request.fullpath
        end
      end
    end
  
  end
  
end