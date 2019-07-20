class Admin::ItemKindsController < ApplicationController
    def index
        @singers = Singer.all
        @genres = Genre.all
        @labels = Label.all

        @singer = Singer.new
        @genre = Genre.new
        @label = Label.new
    end
end
