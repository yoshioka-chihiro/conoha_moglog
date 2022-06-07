class Diary < ApplicationRecord
  belongs_to :end_user
  has_many :favorites, dependent: :destroy
  has_many :diary_comments, dependent: :destroy
end
