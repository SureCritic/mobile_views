module MobileViewsController
  
  module ClassMethods
  
    def has_mobile_views(args={})
      filter_args = args.select {|k,v| %w(only except).include?(k.to_s)}
      before_action :has_mobile_views, filter_args
    end
  
  end

  module InstanceMethods

    def mobile_device?
      if session[MobileViews.mobile_mode_session_var]
        session[MobileViews.mobile_mode_session_var] == "1"
      else
        request.user_agent =~ MobileViews.mobile_user_agent_regex &&
                (MobileViews.mobile_user_agent_exception_regex.nil? || request.user_agent !~ MobileViews.mobile_user_agent_exception_regex)
      end
    end

    def on_mobile_host?
      request.subdomain == MobileViews.mobile_subdomain
    end

    def has_mobile_views
      session[MobileViews.mobile_mode_session_var] = params[:mobile] if params[MobileViews.mobile_mode_session_var]
      if !on_mobile_host? && mobile_device?
        if request.host =~ /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b|localhost/
          raise Exception, "Can't redirect to subdomain 'm.#{request.host}'! Please use e.g. lvh.me"
        else
          domain = request.host.split('.')
          domain = (domain[-2..-1] || domain).join('.') # handles single domain name eg localhost (even though that particular case is excluded above)
          port = ":#{request.port}" unless [80,443].include?(request.port)
          redirect_to "#{request.protocol}#{MobileViews.mobile_subdomain}.#{domain}#{port}#{request.fullpath}"
        end
      end
      request.format = :mobile if on_mobile_host? || mobile_device?
    end
  
  end
  
end
