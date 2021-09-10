class Publics::HomesController < ApplicationController
    def top
    end

    def about
        @genres = Genre.all
        @items = Item.all.order(created_at: :desc).limit(4)
    end
end
