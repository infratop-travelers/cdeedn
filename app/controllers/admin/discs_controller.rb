class Admin::DiscsController < ApplicationController
    before_action :authenticate_admin!
    def create
        @disc = Disc.new(disc_params)
        if @disc.save
            redirect_to edit_admin_item_path(params[:item_id])
        else
            @singers = pull_down_menu(Singer.all)
            @genres = pull_down_menu(Genre.all)
            @labels = pull_down_menu(Label.all)
            @item = Item.find(params[:item_id])
            @item_discs = @item.discs.all
            @discs = pull_down_menu(@item.discs.all)
            @song = Song.new
            @disc_error = "新規ディスクでのエラーです"
            render("admin/items/edit")
        end
    end

    def update
        @disc = Disc.find(params[:id])
        if @disc.update(disc_params)
            redirect_to edit_admin_item_path(params[:item_id])
        else
            @singers = pull_down_menu(Singer.all)
            @genres = pull_down_menu(Genre.all)
            @labels = pull_down_menu(Label.all)
            @item = Item.find(params[:item_id])
            @item_discs = @item.discs.all
            @discs = pull_down_menu(@item.discs.all)
            @song = Song.new
            @disc_error = "ディスク名  #{@disc.name}のディスクでのエラーです"
            render("admin/items/edit")
        end
    end

    def destroy
        @disc = Disc.find(params[:id])
        @disc.delete
        redirect_to edit_admin_item_path(params[:item_id])
    end

    private
        def disc_params
            params.require(:disc).permit(:name, :item_id)
        end
end
