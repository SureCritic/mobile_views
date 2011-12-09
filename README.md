MobileViews
==============

MobileViews redirects from www.example.com to m.example.com and renders a mobile_html instead of html files.

Compability
===========

Tested on Rails 3.0.x and Ruby 1.9.2

Installation and Usage
======================

* Add to your Gemfile:
  gem "mobile_views"

* Run:
  bundle install

* Add to your controller
  before_filter :has_mobile_view

* Create
  application.mobile_html.*
  and accordingly all views e.g.
  index.mobile_html.*

* Restart server if running

Todo
====

- Complete tests

License
=======

[MIT](MIT-LICENSE)

Copyright (c) 2011 Patrick Bartels.