class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  respond_to :html, :json
  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
    before_action do
      #get_user_locale_config if current_user
    end

  #  def get_user_locale_config
  #   set_locale(current_user.locale)
  # end
  #  def set_locale(locale)
  #     I18n.locale = locale || I18n.default_locale
  # end 
end
