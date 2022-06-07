class DiaryComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :diary
end
