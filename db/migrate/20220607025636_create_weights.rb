class CreateWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :weights do |t|
      t.integer :end_user_id
      t.float :value, null: false
      t.time :recorded_at, null: false

      t.timestamps
    end
  end
end
