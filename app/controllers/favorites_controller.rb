class FavoritesController < ApplicationController
  before_action :signed_customer_redirect
  def create
    @favorite = current_customer.favorites.new
    @favorite.item_id = Item.find(params[:item_id]).id
    @favorite.save
    redirect_to item_path(params[:item_id])

  end

  def destroy
    @favorite = Item.find(params[:item_id]).favorites.where(customer_id: current_customer.id)
    @favorite.each do |favorite|
      favorite.delete
    end
    redirect_to item_path(params[:item_id])
  end
end
