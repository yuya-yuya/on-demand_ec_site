class Publics::CartItemsController < ApplicationController
    def index
        @cart_items = CartItem.all
    end
    
    def create
        @cart_item = CartItem.new(cart_items_params)
        @cart_items = current_customer.cart_items.all
        # ↓新規作成された商品とカート内にある商品をeach文を用いて検査して、もし同じであればまとめる。
        @cart_items.each do |cart_item|
          if cart_item.item_id == @cart_item.item_id
            new_amount = cart_item.amount + @cart_item.amount
            cart_item.update(amount: new_amount)
            @cart_item.delete
          end
        end
        # ↓current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present? でもいける。
        # if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present? 
        #     @before_cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        #     new_amount = @cart_item.amount + @before_cart_item.amount
        #     @before_cart_item.update(amount: new_amount)
        #     @cart_item.delete
        # end
        @cart_item.save
        flash[:notice] = "カートに商品を追加しました。"
        redirect_to cart_items_path
    end
    
    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_items_params)
        flash[:notice] = "数量を更新しました。"
        redirect_to cart_items_path
    end
    
    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        flash[:error] = "商品を削除しました。"
        redirect_to cart_items_path
    end
    
    def destroy_all
        @cart_item = current_customer.cart_items
        @cart_item.destroy_all
        flash[:error] = "カート内商品を全て削除しました。"
        redirect_to cart_items_path
        # destroyは一つ、destroy_allは複数を削除する
    end
    
    private
    def cart_items_params
         params.require(:cart_item).permit(:customer_id, :item_id, :amount)
    end
end
