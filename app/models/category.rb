class Category < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :payment, class_name: 'Payment', foreign_key: 'payment_id'

  validates :name, presence: true
  validates :icon, presence: true
end
