class Admin::CustomersController < ApplicationController
    def index
        @customers = Customer.page(params[:page]).per(10)
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        @customer = Customer.find(params[:id])
        @customer.is_subscribed = params[:customer][:is_subscribed].to_i
        if @customer.update(custmer_params)
            flash[:notice] = "ユーザー情報を更新しました。"
            redirect_to admin_customer_path(@customer.id)
        else
            flash[:error] = "必須項目を記入してください。"
            render :edit
        end
    end

    private
    def custmer_params
         params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email,)
    end
end
