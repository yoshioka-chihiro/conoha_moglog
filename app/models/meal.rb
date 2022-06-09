class Meal < ApplicationRecord
  belongs_to :end_user
  has_many :healths,  dependent: :destroy
  has_many :conditions, through: :healths
  has_many :meal_details,  dependent: :destroy
  has_many :foods, through: :meal_details
  #関連付けしたモデルを一緒にデータ保存できるようにする
  accepts_nested_attributes_for :meal_details, allow_destroy: true
  
  with_options presence: true do
    validates :end_user_id
    validates :meal_type
    validates :recorded_at
    validates :meal_details
  end

  
  enum meal_type: { breakfast: 0, lunch: 1, dinner: 2, nash:3 }
  
  
  
end
