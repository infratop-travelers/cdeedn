class Admin::SingersController < ApplicationController

    def create
        @singer = Singer.new(singer_params)
        if @singer.save
            redirect_to admin_item_kinds_path
        else
            redirect_to admin_item_kinds_path
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
