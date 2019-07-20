class Admin::GenresController < ApplicationController

    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            redirect_to admin_item_kinds_path
        else
            redirect_to admin_item_kinds_path
        end
    end

    def destroy
        @genre = Genre.find(params[:id])
        @genre.delete
        redirect_to admin_item_kinds_path
    end

    private
        def genre_params
            params.require(:genre).permit(:name)
        end
end
