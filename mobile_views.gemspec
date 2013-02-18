require File.expand_path("../lib/mobile_views/version", __FILE__)

Gem::Specification.new do |s|
  s.name          = "mobile_views"
  s.version       = MobileViews::VERSION
  s.platform      = Gem::Platform::RUBY
  
  s.authors       = ["Patrick Bartels"]
  s.email         = %q{patrick@bartels.ug}
  s.homepage      = %q{https://github.com/roughneck/mobile_views}
  s.description   = "MobileViews description."
  s.summary       = "MobileViews summary."
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.required_rubygems_version = "> 1.3.6"

  s.add_development_dependency "capybara", ">= 0.4.0"
  
  s.add_dependency "activesupport", "~> 3.0.9"
  s.add_dependency "rails", ">= 3.0.9"
end