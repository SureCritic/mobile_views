require 'rails/generators'
require 'rails/generators/migration'

class MobileViewsGenerator < Rails::Generators::Base
  def copy_initializer_file
    copy_file 'initializer.rb', 'config/initializers/mobile_views.rb'
  end
end