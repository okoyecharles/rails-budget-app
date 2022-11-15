class Payment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :category_payments, class_name: 'CategoryPayment', foreign_key: 'payment_id'
  has_many :categories, through: :category_payments

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
