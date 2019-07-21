class Admin::DiscsController < ApplicationController

    def create
        @disc = Disc.new(disc_params)
        @disc.save
        redirect_to edit_admin_item_path(params[:item_id]), data: {"turbolinks" => false}
    end

    def update
        @disc = Disc.find(params[:id])
        @disc.update(disc_params)
        redirect_to edit_admin_item_path(params[:item_id]), data: {"turbolinks" => false}
    end

    def destroy
        @disc = Disc.find(params[:id])
        @disc.delete
        redirect_to edit_admin_item_path(params[:item_id]), data: {"turbolinks" => false}
    end

    private
        def disc_params
            params.require(:disc).permit(:name, :item_id)
        end
end
