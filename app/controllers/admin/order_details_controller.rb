class Admin::OrderDetailsController < ApplicationController
    def update
        order_detail = OrderDetail.find(params[:id])
        order_detail.update(order_detail_params)
        if order_detail.makeing_status == "progress"
            order = order_detail.order
            order.update(status: "making")
        elsif order_detail.order.order_details.all?{|order_detail| order_detail.makeing_status == "complete"}
            # order_detail.order.order_details.count == @order_detail.order.order_details.where(product_status: 3).count
            # 上記のような書き方もある。数が同じかで比較している。
            order = order_detail.order
            order.update(status: "preparing")
        end
        redirect_to request.referer
    end
    
    private
    def order_detail_params
        params.require(:order_detail).permit(:makeing_status)
    end
end
