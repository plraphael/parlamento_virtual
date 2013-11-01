require 'ember/handlebars/template'
require 'active_model_serializers'

module Emblembar
  module Rails
    class Engine < ::Rails::Engine
      config.handlebars = ActiveSupport::OrderedOptions.new

      config.handlebars.precompile = true
      config.handlebars.templates_root = "templates"
      config.handlebars.templates_path_separator = '/'

      config.before_initialize do |app|
        Sprockets::Enginess #force autoloading
        Sprockets.register_engine '.emblem', Ember::Handlebars::Template
      end
    end
  end
end
