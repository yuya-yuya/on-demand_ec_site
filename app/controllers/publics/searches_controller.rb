class Publics::SearchesController < ApplicationController
  def top
    if params[:order_sort] == "0"
      @items = Item.where("genre_id LIKE ?", "#{params[:search]}").page(params[:page]).per(8)
      @genres = Genre.all
      render "publics/items/index"
    else
      if params[:search].present?
        if params[:how] == "0"
            @items = Item.where("name LIKE ?", "#{params[:search]}").page(params[:page]).per(8)
            @genres = Genre.all
        elsif params[:how] == "1"
            @items = Item.where("name LIKE ?", "#{params[:search]}%").page(params[:page]).per(8)
            @genres = Genre.all
        elsif params[:how] == "2"
            @items =I tem.where("name LIKE ?", "%#{params[:search]}").page(params[:page]).per(8)
            @genres = Genre.all
        else
            @items = Item.where(['name LIKE ?', "%#{params[:search]}%"]).page(params[:page]).per(8)
            @genres = Genre.all
        end
        render "publics/items/index"
        #renderを使うことでコントローラーを経由させない。コントローラーを経由すると変数が変わる。
      else
        flash[:error] = "検索結果なし"
        redirect_to root_path
      end
    end
  end
end
