class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  enum gender: {man: 0, woman: 1}
  enum active_level: {low: 0, middle: 1, high: 2}

  # 画像
  has_one_attached :image

  has_many :weights, dependent: :destroy
  has_many :meals, dependent: :destroy
  has_many :meal_details, through: :meal
  has_many :diaries, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :diary_comments, dependent: :destroy
  has_many :conditions, dependent: :destroy

  # relationshios関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :gender, presence: true
  validates :start_weight, presence: true
  validates :age, presence: true
  validates :height, presence: true
  validates :email, presence: true, uniqueness: true

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = 'テスト太郎'
      user.nickname = 'サンプル'
      user.age = 22
      user.gender = 0
      user.height = 170
      user.start_weight = 57
    end
  end


  # フォローしたときの処理
  def follow(end_user_id)
    relationships.create(followed_id: end_user_id)
  end
  # フォローを外すときの処理
  def unfollow(end_user_id)
    relationships.find_by(followed_id: end_user_id).destroy
  end
  # フォローしているか判定
  def following?(end_user)
    followings.include?(end_user)
  end

  # 基礎代謝の計算_男性
  def basal_metabolism_man
    ( 0.0481 * start_weight + 0.0234 * height - 0.0138 * age - 0.4235 ) * 1000 / 4.186
  end

  # 基礎代謝の計算_女性
  def basal_metabolism_woman
    ( 0.0481 * start_weight + 0.0234 * height - 0.0138 * age - 0.9708 ) * 1000 / 4.186
  end


end
