class DiaryComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :diary
  has_many :reports, dependent: :destroy

  def already_reported?(end_user)
   reports.where(end_user_id: end_user.id).exists?
  end
end
