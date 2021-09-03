class Admin::GenresController < ApplicationController
    def index
        @genres = Genre.all
        @genre = Genre.new
    end
    
    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            flash[:success] = '作成しました'
            redirect_to admin_genres_path
        else
            @genres = Genre.all
            flash[:error] = '必須項目を入力してください'
            render :index
        end
    end
    
    def edit
        @genre = Genre.find(params[:id])
    end
    
    def update
        @genre = Genre.find(params[:id])
        if @genre.update(genre_params)
            flash[:success] = '編集が完了しました'
            redirect_to admin_genres_path
        else
            flash[:error] = '必須項目を入力してください'
            render :edit
        end
    end
    
    private
    def genre_params
         params.require(:genre).permit(:name)
    end
end
