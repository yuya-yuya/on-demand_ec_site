class Publics::CustomersController < ApplicationController
    before_action :authenticate_customer!
    
    def show
        @customer = current_customer
    end
    
    def edit
        @customer = current_customer
    end
    
    def update
        @customer = current_customer
        if @customer.update(custmer_params)
         flash[:notice] = "プロフィールを更新しました。"
         redirect_to show_path
        else
         flash[:error] = "必須項目を記入してください。"
         render :edit
        end
    end
    
    def unsubscribed
    end
    
    def withdraw
        @customer = current_customer
        @customer.update(is_subscribed: 0)
        reset_session
        # ここでセッションを破棄して、ログアウト状態にしている。
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end
    
    private
    def custmer_params
         params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email)
    end
end
