class Record < ApplicationRecord
  validates :name, presence: true
  validates :authorid, presence: true
  validates :minutes, presence: true
  belongs_to :author, class_name: 'User', foreign_key: 'authorid'
  belongs_to :group
end
