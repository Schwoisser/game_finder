class ImpressumController < ActionController::Base
  before_action :set_locale

  def set_locale
    if current_user
      I18n.locale = current_user.locale
    else
      I18n.locale = I18n.default_locale
    end
  end
    
  def imprint
  end
  def privacy_policy
  end
end