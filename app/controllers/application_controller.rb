class ApplicationController < ActionController::Base
  include Response
  protect_from_forgery with: :exception
end
