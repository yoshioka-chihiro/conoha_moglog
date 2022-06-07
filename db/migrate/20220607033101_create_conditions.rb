class CreateConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :conditions do |t|
      t.integer :end_user_id
      t.integer :movement, default: "2"
      t.integer :feel, default: "1"

      t.timestamps
    end
  end
end
