module MobileViews
  mattr_accessor :mobile_subdomain
  @@mobile_subdomain = 'm'
  mattr_accessor :default_subdomain
  @@default_subdomain = 'www'
  mattr_accessor :mobile_mode_session_var
  @@mobile_mode_session_var = :mobile
  mattr_accessor :mobile_user_agent_regex
  @@mobile_user_agent_regex = /Mobile|webOS/
  mattr_accessor :mobile_user_agent_exception_regex
  @@mobile_user_agent_exception_regex = /iPad;/

  class Engine < Rails::Engine

    initializer "mobile_views.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

    initializer 'mobile_views.controller' do
      ActiveSupport.on_load(:action_controller) do
        include MobileViewsController::InstanceMethods
        extend MobileViewsController::ClassMethods
      end
    end
  end

end