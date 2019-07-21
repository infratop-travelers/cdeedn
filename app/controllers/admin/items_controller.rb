class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
    @singers = pull_down_menu(Singer.all)
    @genres = pull_down_menu(Genre.all)
    @labels = pull_down_menu(Label.all)
  end

  def edit
    @singers = pull_down_menu(Singer.all)
    @genres = pull_down_menu(Genre.all)
    @labels = pull_down_menu(Label.all)
    @item = Item.find(params[:id])
    @item_discs = @item.discs.all
    @disc = Disc.new
    @song = Song.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "successfully"
      redirect_to admin_item_path(@item)
    else
      flash[:notice] = "error"
      redirect_to admin_items_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      flash[:notice] = "successfully"
      redirect_to admin_item_path(@item)
    else
      flash[:notice] = "error"
      redirect_to edit_admin_item_path(@item)
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end

  private
    def item_params
      params.require(:item).permit(:image, :singer, :label, :genre, :name, :price, :stock, :delivery_status, :singer_id, :genre_id, :label_id)
    end
end

def pull_down_menu(model)
  menu_array = []
  model.each do |m|
    menu_array += [[m.name, m.id]]
  end
  return menu_array
end