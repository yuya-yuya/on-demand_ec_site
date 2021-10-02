class Publics::OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
    end

    def new
        @order = Order.new
        if current_customer.cart_items.empty?
            flash[:error] = "カートが空です。"
            redirect_to cart_items_path
        end
    end
    
    def confirm
        @cart_items = current_customer.cart_items
        @order = Order.new(order_params)
        @order.payment_method = params[:order][:payment_method].to_i 
        if params[:order][:address_option] == "0"
            @order.name = current_customer.last_name + current_customer.first_name
            @order.postal_code = current_customer.postcode
            @order.address = current_customer.address
        elsif params[:order][:address_option] == "1"
            @address = Address.find(params[:order][:address_id].to_i)
            @order.postal_code = @address.postal_code
            @order.address = @address.address
            @order.name = @address.name
        end
    end
    
    def create
        @order = Order.new(order_params)
        @order.payment_method = params[:order][:payment_method]
        @order.customer_id = current_customer.id
        @order.shipping_cost = 800
        @order.save
        current_customer.cart_items.each do |cart_item|
            @order_item = OrderDetail.new
            @order_item.order_id = @order.id
            @order_item.amount = cart_item.amount
            @order_item.price = (cart_item.item.price * 1.1).floor
            @order_item.item_id = cart_item.item_id
            @order_item.save
        end
        # ↑order_detailに保存する
        current_customer.cart_items.destroy_all
        # ↑orderとorder_detailに保存したので、カート内商品は削除。
        redirect_to thanks_path
    end
    
    def thanks
    end
    private
    def order_params
        params.require(:order).permit(:customer_id, :total_payment, :shipping_cost, :postal_code, :address, :name)
    end
end
