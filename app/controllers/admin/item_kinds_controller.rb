class Admin::ItemKindsController < ApplicationController
    before_action :authenticate_admin!
    def index
        @singers = Singer.all
        @genres = Genre.all
        @labels = Label.all

        @singer = Singer.new
        @genre = Genre.new
        @label = Label.new
    end
end
