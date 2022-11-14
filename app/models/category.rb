class Category < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :category_payments, class_name: 'CategoryPayment', foreign_key: 'category_id'

  validates :name, presence: true
  validates :icon, presence: true
end
