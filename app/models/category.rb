class Category
  has_many :payments, class_name: 'Payment', foreign_key: 'payment_id'
  has_many :users, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true
  validates :icon, presence: true
end
