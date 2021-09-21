class Admin::OrdersController < ApplicationController
    def index
        case params[:order_sort]
        when "0"
            @customer = Customer.find(params[:id])
            @orders = @customer.orders
            p @orders
        else
            @orders = Order.all
        end
    end
    
    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
    end
    
    def update
        order = Order.find(params[:id])
        order.update(order_params)
        order_details = order.order_details
        if order.status == "confirm"
            order_details.each do |order_detail|
                order_detail.update(makeing_status: "waiting")
            end
        end
        redirect_to admin_order_path(order.id)
    end
    
    private
    def order_params
        params.require(:order).permit(:status)
    end
end
