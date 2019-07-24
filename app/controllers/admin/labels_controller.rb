class Admin::LabelsController < ApplicationController
    before_action :authenticate_admin!
    def create
        @label = Label.new(label_params)
        if @label.save
            redirect_to admin_item_kinds_path
        else
            @singers = Singer.all
            @genres = Genre.all
            @labels = Label.all

            @singer = Singer.new
            @genre = Genre.new

            @label_error= "新規レーベル作成でのエラーです"
            render ("admin/item_kinds/index")
        end
    end

    def update
        @label = Label.find(params[:id])
        if @label.update(label_params)
            redirect_to admin_item_kinds_path
        else
            @singers = Singer.all
            @genres = Genre.all
            @labels = Label.all

            @singer = Singer.new
            @genre = Genre.new

            @label_error= "レーベル編集でのエラーです"
            render ("admin/item_kinds/index")
        end
    end

    def destroy
        @label = Label.find(params[:id])
        @label.delete
        redirect_to admin_item_kinds_path
    end

    private
        def label_params
            params.require(:label).permit(:name)
        end
end
