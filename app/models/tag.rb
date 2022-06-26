class Tag < ApplicationRecord
  
  has_many :tag_diaries, dependent: :destroy
  has_many :diaries, through: :tag_diaries
  
end
