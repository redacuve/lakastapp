class Record < ApplicationRecord
  validates :name, presence: true
  validates :authorid, presence: true
  validates :minutes, presence: true
  belongs_to :author, class_name: 'User', foreign_key: 'authorid'
  belongs_to :group, optional: true
  scope :recents, -> { order(updated_at: :desc) }
  scope :ancients, -> { order(updated_at: :asc) }
  scope :grouped, -> { where.not(group_id: nil) }
  scope :not_grouped, -> { where(group_id: nil) }
  scope :mine, ->(user_id) { where(authorid: user_id) }
  scope :order_record, ->(ord) { order(updated_at: ord) }
end
