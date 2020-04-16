class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  before_save :downcases
  before_validation :remove_whitespaces_downcases
  validates :name, presence: true, length: { maximum: 100 }
  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 200 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  has_many :groups
  has_many :records, foreign_key: 'authorid'

  private

  def remove_whitespaces_downcases
    self.email = email.strip
    self.username = username.strip.downcase
  end

  def downcases
    self.email = email.strip.downcase
    self.username = username.strip.downcase
  end
end
