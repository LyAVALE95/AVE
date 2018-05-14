class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  respond_to :html, :json
  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
    before_action do
      get_user_locale_user if current_user
    end

    def get_user_locale_user
      @myuser = current_user 
      if @myuser.rol == "s" 
      @myuser = UserStudent.select("users.id,user_students.*").joins("join users")
      .where("users.id=? and user_students.user_id=?",current_user.id,current_user.id).first
    else 
      @myuser = UserTeacher.select("users.id,user_teachers.*").joins("join users")
      .where("users.id=? and user_teachers.user_id=?",current_user.id,current_user.id).first
    end
   end
  #  def set_locale(locale)
  #     I18n.locale = locale || I18n.default_locale
  # end 
end
