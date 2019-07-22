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
      redirect_to admin_item_path(@item)
    else
      @singers = pull_down_menu(Singer.all)
      @genres = pull_down_menu(Genre.all)
      @labels = pull_down_menu(Label.all)
      @item_error = "新規商品作成のエラーです"
      render ("admin/items/new")
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to edit_admin_item_path(@item)
    else
      @singers = pull_down_menu(Singer.all)
      @genres = pull_down_menu(Genre.all)
      @labels = pull_down_menu(Label.all)
      @item_discs = @item.discs.all
      @disc = Disc.new
      @song = Song.new
      @item_error = "商品編集のエラーです"
      render "admin/items/edit"
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end

  private
    def item_params
      params.require(:item).permit(:image, :singer, :label, :genre, :name, :price, :stock, :singer_id, :genre_id, :label_id)
    end
end
