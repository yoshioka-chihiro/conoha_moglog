class DiaryComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :diary
  
  # 通報済みかどうか判断するメソッド
  def already_reported?(diary_comment)
   reports.where(end_user_id: end_user.id).exists?
  end
end
