require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pointer
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

class ApplicationController < ActionController::Base
  before_action :autorizar_usuario
  
  private
  
  def usuario_atual
    @usuario_atual ||= Usuario.find_by(id: session[:usuario_id]) if session[:usuario_id]
  end
  helper_method :usuario_atual
  
  def autorizar_usuario
    redirect_to login_path, alert: "Por favor, faça login para continuar" unless usuario_atual
  end
  
  def requerir_admin
    redirect_to painel_path, alert: "Acesso não autorizado" unless usuario_atual&.admin?
  end
end
