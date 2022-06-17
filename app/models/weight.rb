class Weight < ApplicationRecord
  belongs_to :end_user
  validates :record_day, presence: true
  validates :value, presence: true, length: { minimum: 20, maximum: 200 }
end
