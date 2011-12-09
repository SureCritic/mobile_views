module MobileViews
  require "action_controller"
  Mime::Type.register_alias "text/html", :mobile_html
end

require "mobile_views/engine"