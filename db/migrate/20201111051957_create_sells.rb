class CreateSells < ActiveRecord::Migration[6.0]
  def change
    create_table :sells do |t|

      t.timestamps
    end
  end
end
