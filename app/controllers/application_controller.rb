class ApplicationController < ActionController::Base
  include LocaleDetection

  before_action :set_locale
end
