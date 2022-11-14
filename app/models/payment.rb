class Payment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
