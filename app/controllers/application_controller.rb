class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def default_url_options
    if Rails.env.production?
      { host: 'undermind.herokuapp.com' }
    else
      { host: ENV['HOST'] || 'localhost:3000' }
    end
  end
end
