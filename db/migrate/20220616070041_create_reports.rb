class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :end_user, null: false, foreign_key: true
      t.references :diary_comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
