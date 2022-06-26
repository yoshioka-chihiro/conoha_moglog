class Diary < ApplicationRecord
  belongs_to :end_user
  has_many :favorites, dependent: :destroy
  has_many :diary_comments, dependent: :destroy

  has_many :tag_diaries, dependent: :destroy
  has_many :tags, through: :tag_diaries

  scope :published, -> {where(is_published_flag: true)}
  scope :unpublished, -> {where(is_published_flag: false)}

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited?(end_user)
   favorites.where(end_user_id: end_user.id).exists?
  end

  # 日記検索
  def self.looks(word)
  where(["title like? OR body like?", "%#{word}%", "%#{word}%"])
  end

  # 日記の名前
  def diary_name(end_user)
    if end_user.nickname.empty?
      "匿名希望さん"
    else
      end_user.nickname
    end
  end


 def save_tags(tags)
   current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
   old_tags = current_tags - tags
   new_tags = tags - current_tags

   # Destroy
   old_tags.each do |old_name|
     self.tags.delete Tag.find_by(tag_name:old_name)
   end

   # Create
   new_tags.each do |new_name|
     diary_tag = Tag.find_or_create_by(tag_name:new_name)
     self.tags << diary_tag
   end
 end




end
