class Admin::ItemsController < ApplicationController
    def index
        @items=Item.page(params[:page]).per(8)
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def new
         @item = Item.new
         @genres = Genre.all
    end
    
    def edit
        @item = Item.find(params[:id])
        @genres = Genre.all
    end
   
    def create
        @item = Item.new(item_params)
        @genres = Genre.all
        if @item.save
            flash[:notice] = '商品を新規追加しました。'
            redirect_to admin_item_path(@item)
        else
            flash[:error] = '必須項目を入力してください。'
            render :new
        end
    end

    def update
        @item = Item.find(params[:id])
        @genres = Genre.all
        if @item.update(item_params)
            flash[:notice] = '商品情報を更新しました。'
            redirect_to admin_item_path(@item.id)
        else
            flash[:error] = '必須項目を入力してください。'
            render :edit
        end
    end
    
    private
    def item_params
         params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image)
    end
end