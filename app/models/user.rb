class User < ApplicationRecord
  validates :name, presence: true, length: { in: 2..10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{2,10}+\z/i
  validates :password, presence: true, length: {in: 8..32 }, on: :create
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, on: :create


  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
  has_many :comment_topics, through: :comments, source: 'topic'
end
