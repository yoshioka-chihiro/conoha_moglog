class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "End_user"
  belongs_to :followed, class_name: "End_user"
end
