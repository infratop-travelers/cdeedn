class Admin::SongsController < ApplicationController

    def create
      @song = Song.new(song_params)
      if @song.save
        redirect_to edit_admin_item_path(params[:item_id]), data: {"turbolinks" => false}
      else
        @singers = pull_down_menu(Singer.all)
        @genres = pull_down_menu(Genre.all)
        @labels = pull_down_menu(Label.all)
        @item = Item.find(params[:item_id])
        @item_discs = @item.discs.all
        @disc = Disc.new

        @song_error = "新規曲作成でのエラーです"
        render "admin/items/edit"
      end
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(song_params)
            redirect_to edit_admin_item_path(params[:item_id]), data: {"turbolinks" => false}
        else
            @singers = pull_down_menu(Singer.all)
            @genres = pull_down_menu(Genre.all)
            @labels = pull_down_menu(Label.all)
            @item = Item.find(params[:item_id])
            @item_discs = @item.discs.all
            @disc = Disc.new

            @song_error = "曲編集でのエラーです"
            render "admin/items/edit"

        end
    end

    def destroy
        @song = Song.find(params[:id])
        @song.delete
        redirect_to edit_admin_item_path(params[:item_id]), data: {"turbolinks" => false}
    end

    private
        def song_params
            params.require(:song).permit(:name, :disc_id, :number)
        end
end
