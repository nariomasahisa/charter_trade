class CreateCharterUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :charter_users do |t|
      t.references :charter, foreign_key: true
      t.references :user,    foreign_key: true
      t.timestamps
    end
  end
end
