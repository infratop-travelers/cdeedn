class Admin::SongsController < ApplicationController

    def create
      @song = Song.new(song_params)
      @song.save
      redirect_to edit_admin_item_path(params[:item_id]), data: {"turbolinks" => false}
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)
        redirect_to edit_admin_item_path(params[:item_id]), data: {"turbolinks" => false}
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
