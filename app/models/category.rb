class Category < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :category_payments, class_name: 'CategoryPayment', foreign_key: 'category_id'
  has_many :payments, through: :category_payments

  validates :name, presence: true
  validates :icon, presence: true

  def recent_payments
    payments.order(created_at: :desc)
  end

  def total_price
    payments.sum(&:amount)
  end

  def payments_count
    payments.count
  end
end
