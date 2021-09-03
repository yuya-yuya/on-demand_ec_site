# frozen_string_literal: true

class Publics::SessionsController < Devise::SessionsController
  before_action :reject_inactive_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  
  def reject_inactive_user
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer.nil?
       flash[:error] = "未登録ユーザーです。"
       redirect_to new_customer_session_path
    else
      if @customer.valid_password?(params[:customer][:password]) && @customer.is_subscribed == "退会済"
        flash[:error] = "退会済みユーザーです。"
        redirect_to new_customer_session_path
      end
    # 退会済みならここを通るし、有効ならここをすり抜けてcreateアクションに入る。
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

