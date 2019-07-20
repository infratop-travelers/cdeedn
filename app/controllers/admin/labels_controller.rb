class Admin::LabelsController < ApplicationController
    def create
        @label = Label.new(label_params)
        if @label.save
            redirect_to admin_item_kinds_path
        else
            redirect_to admin_item_kinds_path
        end
    end

    private
        def label_params
            params.require(:label).permit(:name)
        end
end
