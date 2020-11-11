class CreateSells < ActiveRecord::Migration[6.0]
  def change
    create_table :sells do |t|
      t.integer     :sell,       null: false
      t.references  :user,       foreign_key: true
      t.references  :charter,    foreign_key: true
      t.timestamps
    end
  end
end
