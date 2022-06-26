class DropTagmaps < ActiveRecord::Migration[6.1]
  def change
    drop_table :tagmaps do |t|
      t.string :diary_id, null: false
      t.string :tag_id, null:false
    end
  end
end
