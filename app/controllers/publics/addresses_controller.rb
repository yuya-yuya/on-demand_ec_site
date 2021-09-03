class Publics::AddressesController < ApplicationController
    def index
        @address = Address.new
        @addresses = Address.all
    end
    
    def create
        address = Address.new(addresses_params)
        address.customer_id = current_customer.id
        if address.save
            redirect_to addresses_path
        else
            flash[:error] = "必須項目を記入してください。"
            render :index
        end
    end
    
    def edit
        @address = Address.find(params[:id])
    end
    
    def update
        @address = Address.find(params[:id])
        if @address.update(addresses_params)
            redirect_to addresses_path
        else
            flash[:error] = "必須項目を記入してください。"
            render :edit
        end
    end
    
    def destroy
        address = Address.find(params[:id])
        address.destroy
        flash[:delete] = "削除しました。"
        redirect_to addresses_path
    end
    
    
    private
    def addresses_params
        params.require(:address).permit(:name, :postal_code, :address)
    end
end
