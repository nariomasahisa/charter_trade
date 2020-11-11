class CreateSells < ActiveRecord::Migration[6.0]
  def change
    create_table :sells do |t|
      t.integer     :sell_price, null: false
      t.references  :user_id,    null: false
      t.references  :charter_id, null: false
      t.timestamps
    end
  end
end
