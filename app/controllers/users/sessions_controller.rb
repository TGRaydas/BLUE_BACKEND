# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
     userparam = params[:username].strip.downcase
     password = params[:password]
     user = User.find_by(email:userparam)
     if user.nil?
      render :json => {state:'invalid user name'}
      return
     end
     if user.valid_password?(password)
        sign_in(user)
        render :json => {state: 'success', userid: user.id}
        return
     else
      render :json => {state: 'invalid password'}
      puts("hello1")
      return
     end
     
  end

  # DELETE /resource/sign_out
  def destroy
    user = User.find_by_email(params[:username])
    sign_out user
    render json:{status:'success'}
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
   end
end
