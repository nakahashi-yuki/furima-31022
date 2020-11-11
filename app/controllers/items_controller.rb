class ItemsController < ApplicationController
  before_action :basic_auth
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_params_id, except: [:index, :new, :create]

  def index
    # @items = Item.order("created_at DESC")

    @items = Item.all.order('created_at DESC')
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

  def edit
    # URL直とび防止の条件分岐
    redirect_to root_path unless current_user == @item.user
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user == @item.user
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :product_condition_id, :delivery_fee_id, :shipment_source_id, :day_id, :selling_price).merge(user_id: current_user.id)
  end

  def find_params_id
    @item = Item.find(params[:id])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
