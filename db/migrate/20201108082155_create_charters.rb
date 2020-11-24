class CreateCharters < ActiveRecord::Migration[6.0]
  def change
    create_table :charters do |t|
      t.string  :departure,       null: false
      t.string  :arrive,          null: false
      t.integer :size,            null: false
      t.integer :buy_price,       null: false
      t.integer :prefecture_id,   null: false
      t.string  :city,            null: false
      t.string  :charter_address, null: false
      t.string  :build_name,      null: false
      t.string :tell_number,     null: false
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end