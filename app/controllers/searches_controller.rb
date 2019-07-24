class SearchesController < ApplicationController
    before_action :signed_customer_redirect

    def index
        @items = Item.all
        @genres = Genre.all
        @labels = Label.all
        @singers = Singer.all
    end

    def search
        @items = Item.where("name LIKE ?", "%#{params[:search]}%")
        @genres = Genre.where("name LIKE ?", "%#{params[:search]}%")
        @labels = Label.where("name LIKE ?", "%#{params[:search]}%")
        @singers = Singer.where("name LIKE ?", "%#{params[:search]}%")
        render "searches/index"
    end

end
