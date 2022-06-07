class CreateHealths < ActiveRecord::Migration[6.1]
  def change
    create_table :healths do |t|
      t.integer :meal_id
      t.integer :condition_id

      t.timestamps
    end
  end
end
