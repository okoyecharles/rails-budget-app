class User < ApplicationRecord
  has_many :payments, class_name: 'Payment', foreign_key: 'author_id'
  has_many :categories, class_name: 'Category', foreign_key: 'author_id'

  validates :name, presence: true
end
