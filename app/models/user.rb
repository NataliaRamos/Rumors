class User < ActiveRecord::Base
  has_secure_password
  has_many :rumors
  has_many :likes
  has_many :rumors_liked, through: :likes, source: :rumor
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, :password, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
