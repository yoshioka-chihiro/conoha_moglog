class AddActiveLevelToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :active_level, :integer
  end
end
