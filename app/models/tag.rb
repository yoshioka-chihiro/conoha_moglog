class Tag < ApplicationRecord
  
  has_many :tagmaps, dependent: :destroy
  has_many :diaries, through: :tagmaps
  
end
