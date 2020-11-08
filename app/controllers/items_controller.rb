class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # @items = Item.order("created_at DESC")

    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    # URL直とび防止の条件分岐
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :product_condition_id, :delivery_fee_id, :shipment_source_id, :day_id, :selling_price).merge(user_id: current_user.id)
  end
end
