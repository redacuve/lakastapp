class Group < ApplicationRecord
  mount_uploader :icon, IconUploader
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true
  belongs_to :user
  has_many :records
end
