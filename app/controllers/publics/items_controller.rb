class Publics::ItemsController < ApplicationController
    PER = 8
    
    def index
        @items = Item.all
        @genres = Genre.all
    end
    
    def show
        @item = Item.find(params[:id])
        @cart_item = CartItem.new
        @genres = Genre.all
    end
    
end
