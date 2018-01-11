class ItemsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @items = Item.all.page(params[:page])
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end
end