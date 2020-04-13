class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true
  belongs_to :user
  has_many :records, through: :record_groups
end
