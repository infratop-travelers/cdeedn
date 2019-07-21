class Admin::SongsController < ApplicationController

    def create
      @song = Song.new(song_params)
      @song.save
      redirect_to edit_admin_item_path(params[:item_id])
    end

    def destroy
    
    end

    private
        def song_params
            params.require(:song).permit(:name, :disc_id, :number)
        end
end
