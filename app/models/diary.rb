class Diary < ApplicationRecord
  belongs_to :end_user
  has_many :favorites, dependent: :destroy
  has_many :diary_comments, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited?(end_user)
   favorites.where(end_user_id: end_user.id).exists?
  end

  # 日記検索
  def self.looks(word)
      @diary = Diary.where("title LIKE?","%#{word}%")
  end
  
  def diary_name(end_user)
    if end_user.nickname.empty?
      "匿名希望さん"
    else
      end_user.nickname
    end
  end

end
