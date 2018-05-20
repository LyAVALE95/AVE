# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
  #   super
    respond_to do |format|
      format.html { super }
      format.json { sign_in_json }
    end
   end

  def destroy
  
    respond_to do |format|
      format.html { super }
      format.json { sign_out_json }
    end
  end
  
  private
  
  def sign_in_json
  # Fetch params
     email = params[:session][:email] if params[:session]
     password = params[:session][:password] if params[:session]
  
     id = User.find_by(email: email).try(:id) if email.presence
  
    # Validations
    if request.format != :json
      render status: 406, json: { message: t('request_must_be_json') }
      return
    end
  
    if email.nil? or password.nil?
      render status: 400, json: { message: t('request_must_usr_pwd') }
      return
    end
  
    # Authentication
    user = User.find_by(email: email)
  
    if user
      if user.valid_password? password
        #user.reset_authentication_token! hay que agregar validacion
        # Note that the data which should be returned depends heavily of the API client needs.
        render status: 200, json: { email: user.email, authentication_token: user.authentication_token,
          id: id  ,rol: user.rol , name: user.name, last_name: user.lastnames 
          #Campos Comentados: , company_id: user.company_id, company_name: user.company.name
          #user.last_name cambio a user.lastnames
        }

      else
        render status: 401, json: { message: t('request_invalid_usr_pwd') }
      end
    else
      render status: 401, json: { message: t('request_invalid_usr_pwd') }
    end
  end
  
  def sign_out_json
     # Fetch params
    user = User.find_by(authentication_token: params[:user_token])
  
    if user.nil?
      render status: 404, json: { message: t('request_invalid_token') }
    else
      user.authentication_token = nil
      user.save!
      render status: 204, json: nil
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
  