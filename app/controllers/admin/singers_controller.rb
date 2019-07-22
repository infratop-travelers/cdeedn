class Admin::SingersController < ApplicationController

    def create
        @singer = Singer.new(singer_params)
        if @singer.save
            redirect_to admin_item_kinds_path
        else
            @singers = Singer.all
            @genres = Genre.all
            @labels = Label.all

            @genre = Genre.new
            @label = Label.new

            @singer_error = "新規アーティスト作成のエラーです"
            render ("admin/item_kinds/index")
        end
    end

    def update
        @singer = Singer.find(params[:id])
        if @singer.update(singer_params)
            redirect_to admin_item_kinds_path
        else
            @singers = Singer.all
            @genres = Genre.all
            @labels = Label.all

            @genre = Genre.new
            @label = Label.new

            @singer_error = "アーティスト編集のエラーです"
            render ("admin/item_kinds/index")
        end
    end

    def destroy
        @singer = Singer.find(params[:id])
        @singer.delete
        redirect_to admin_item_kinds_path
    end

    private
        def singer_params
            params.require(:singer).permit(:name)
        end
end
