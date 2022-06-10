class AddCommentToDiaryComments < ActiveRecord::Migration[6.1]
  def change
    add_column :diary_comments, :comment, :text
  end
end
