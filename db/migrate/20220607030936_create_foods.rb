class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.text :introduction
      t.integer :calorie
      t.integer :protein
      t.integer :carbohydrate
      t.integer :fat
      t.integer :fiber

      t.timestamps
    end
  end
end
