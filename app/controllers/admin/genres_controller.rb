class Admin::GenresController < ApplicationController

    def create
        @genre = Genre.new(genre_params)
        if @genre.save
            redirect_to admin_item_kinds_path
        else
            @singers = Singer.all
            @genres = Genre.all
            @labels = Label.all

            @singer = Singer.new
            @label = Label.new

            @genre_error= "新規ジャンルでのエラーです"
            render ("admin/item_kinds/index")
        end
    end

    def update
        @genre = Genre.find(params[:id])
        if @genre.update(genre_params)
            redirect_to admin_item_kinds_path
        else
            @singers = Singer.all
            @genres = Genre.all
            @labels = Label.all

            @singer = Singer.new
            @label = Label.new

            @genre_error= "ジャンル編集sでのエラーです"
            render ("admin/item_kinds/index")
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
