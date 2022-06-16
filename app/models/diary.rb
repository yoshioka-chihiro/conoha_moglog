class Diary < ApplicationRecord
  belongs_to :end_user
  has_many :favorites, dependent: :destroy
  has_many :diary_comments, dependent: :destroy

  def favorited?(end_user)
   favorites.where(end_user_id: end_user.id).exists?
  end

end
