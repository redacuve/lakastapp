class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 200 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  has_many :groups
  has_many :records, foreign_key: 'authorid'
end
