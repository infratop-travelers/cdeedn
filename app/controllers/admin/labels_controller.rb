class Admin::LabelsController < ApplicationController
    def create
        @label = Label.new(label_params)
        if @label.save
            redirect_to admin_item_kinds_path
        else
            redirect_to admin_item_kinds_path
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
