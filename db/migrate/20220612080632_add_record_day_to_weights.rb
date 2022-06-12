class AddRecordDayToWeights < ActiveRecord::Migration[6.1]
  def change
    add_column :weights, :record_day, :date
  end
end
