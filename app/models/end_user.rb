class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  enum gender: { man: 0, woman: 1 }

  has_one_attached :image
  has_many :weights, dependent: :destroy
  has_many :meals, dependent: :destroy
  has_many :diaries, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :diary_comments, dependent: :destroy
  has_many :conditions, dependent: :destroy

  # relationshios関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower


end
