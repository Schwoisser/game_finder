class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :set_locale

  def set_locale
    if current_user
      I18n.locale = current_user.locale
    else
      I18n.locale = I18n.default_locale
    end
  end
  
end
