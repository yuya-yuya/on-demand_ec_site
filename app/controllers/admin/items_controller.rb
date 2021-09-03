class Admin::ItemsController < ApplicationController
    def index
        @items = Item.all
    end
    
    def show
    end
    
    def new
         @item = Item.new
         @genres = Genre.all
    end
    
    def create
        
        @item = Item.new(item_params)
        @genres = Genre.all
        if @item.save
            redirect_to admin_item_path(@item)
        else
            flash[:error] = '必須項目を入力してください'
            render :new
        end
    end
    
    private
    def item_params
         params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id)
    end
end