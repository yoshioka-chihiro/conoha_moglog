class Report < ApplicationRecord
  belongs_to :diary_comment
  belongs_to :end_user
end
