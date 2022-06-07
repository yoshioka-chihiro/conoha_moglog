class Health < ApplicationRecord
  belongs_to :meal
  belongs_to :condition
end
