class Group < ApplicationRecord
  mount_uploader :icon, IconUploader
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true
  validates :icon, presence: true
  belongs_to :user
  has_many :records
  scope :order_group, ->(ord) { order(updated_at: ord) }
end
