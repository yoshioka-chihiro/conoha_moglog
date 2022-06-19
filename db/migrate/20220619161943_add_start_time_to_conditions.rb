class AddStartTimeToConditions < ActiveRecord::Migration[6.1]
  def change
    add_column :conditions, :start_time, :datetime
  end
end
