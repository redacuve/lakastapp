class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true
  belongs_to :user
end
