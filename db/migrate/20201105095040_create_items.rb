class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name,                  nill: false
      t.text :explanation,             nill: false
      t.integer :category_id,          nill: false
      t.integer :product_condition_id, nill: false
      t.integer :delivery_fee_id,      nill: false
      t.integer :shipment_source_id,   nill: false
      t.integer :day_id,              nill: false
      t.integer :selling_price,        nill: false
      t.references :user

      t.timestamps
    end
  end
end
