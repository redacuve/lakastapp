class Record < ApplicationRecord
  validates :name, presence: true
  validates :authorid, presence: true
  validates :minutes, presence: true
  belongs_to :author, class_name: 'User', foreign_key: 'authorid'
  belongs_to :group, optional: true
  scope :grouped, -> { where.not(group_id: nil) }
  scope :not_grouped, -> { where(group_id: nil) }
  scope :mine, ->(user_id) { where(authorid: user_id) }
  scope :order_record, ->(ord) { order(updated_at: ord) }
  scope :all_my_total, ->(user, ord = 'desc') { Record.mine(user).includes(:group).order_record(ord) }
  scope :all_my_records, ->(user, ord = 'desc') { Record.mine(user).grouped.includes(:group).order_record(ord) }
  scope :all_my_external, ->(user, ord = 'desc') { Record.mine(user).not_grouped.includes(:group).order_record(ord) }
end
