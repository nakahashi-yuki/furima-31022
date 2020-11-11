class PurchasesStreetAddress
  # ↑rails g modelで作らず、自分で作成する。（ActiveRecodeが継承されたら困るため）
  # rails g modelで作ってActiveRecodeを消すのはあり？（多分マイグレーションとか他もファイルも生成してしまうからNGっぽい）
  include ActiveModel::Model
  # コントローラーのストロングパラメーターから許可されるカラムが、PurchaseモデルではなくPurchasesStreetAddressに来ることを強制する記述！
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. "}
    validates :prefectures_id
    validates :municipality
    validates :address
    validates :phone_number, format: { with:/\A[0-9]+\z/, message: "is invalid."}
    validates :token
  end

  # createアクションの@purchases.saveの処理は、ここに来る！
  # def save
  #   Purchase.create(token: token)
  #   # 各テーブルにデータを保存する処理を書く
  #   # postal_code: postal_code  =  paramsの箱：  実際に入れるデータ
  #   StreetAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  # end

  def save
    test = Purchase.create(
                          item_id: item_id,
                          user_id: user_id
                        )
    StreetAddress.create(
      purchase_id: test.id,
      postal_code: postal_code,
      prefectures_id: prefectures_id,
      municipality: municipality,
      address: address,
      building_name: building_name,
      phone_number: phone_number
    )
  end

end