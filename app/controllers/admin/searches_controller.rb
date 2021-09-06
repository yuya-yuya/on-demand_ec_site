class Admin::SearchesController < ApplicationController
  def search
    if params[:search].present?
      if params[:model] == "user"
          if params[:how] == "0"
              @customers = Customer.where("name LIKE ?", "#{params[:search]}")
          elsif params[:how] == "1"
              @customers = Customer.where("name LIKE ?", "#{params[:search]}%")
          elsif params[:how] == "2"
              @customers = Customer.where("name LIKE ?", "%#{params[:search]}")
          else
              @customers = Customer.where(['name LIKE ?', "%#{params[:search]}%"])
          end
          render "admin/customers/index"
      elsif params[:model] == "item"
          if params[:how] == "0"
              @items = Item.where("name LIKE ?", "#{params[:search]}")
          elsif params[:how] == "1"
              @items = Item.where("name LIKE ?", "#{params[:search]}%")
          elsif params[:how] == "2"
              @items =I tem.where("name LIKE ?", "%#{params[:search]}")
          else
              @items = Item.where(['name LIKE ?', "%#{params[:search]}%"])
          end
          render "admin/items/index"
      end
    else
      flash[:error] = "検索結果なし"
      redirect_to admin_root_path
    end
  end
end
