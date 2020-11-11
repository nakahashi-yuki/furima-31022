class PurchasesController < ApplicationController
  before_action :authenticate_user!


  def index
    # 購入しようとしている商品のレコードを取得。
    @item = Item.find(params[:item_id])
    # purchases_street_addressの空を生成。＝＞ ここに入力して直接createへ！
    @purchases = PurchasesStreetAddress.new
    if current_user.id == @item.user_id
      redirect_to root_path
    else
      render :index
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchases = PurchasesStreetAddress.new(purchases_params)
    if @purchases.valid?
      pay_item
      @purchases.save
      return redirect_to root_path
    else
      render :index
    end
  end
  

  private
  def purchases_params
    # params=大箱、require=中箱、permit=小箱。merge＝大箱のなかに入りつつ、中箱には入っていないやつ。参考: test.rb
    params.require(:purchases_street_address).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name,:phone_number).merge( user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    # params.permit(:postal_code, :prefectures_id, :municipality, :address, :building_name,:phone_number, :token, :item_id).merge( user_id: current_user.id)
    # params.require(:purchase).permit(:purchases).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        # amount: purchases_params[:purchase],
        amount: @item.selling_price,
        # ここのpurchases_paramsについて聞く
        card: purchases_params[:token],
        currency: 'jpy'
      )
  end

  def set_item

  end
end
