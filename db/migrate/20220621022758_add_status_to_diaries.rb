class AddStatusToDiaries < ActiveRecord::Migration[6.1]
  def change
    add_column :diaries, :is_published_flag, :boolean, null: false, default: true
  end
end
