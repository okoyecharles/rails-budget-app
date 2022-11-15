require 'rails_helper'

RSpec.describe CategoryPayment, type: :model do
  subject do
    user = User.create(name: 'Charles', email: 'okoyecharles509@gmail.com', password: 'qwerty', confirmed_at: Time.now)
    category = Category.create(author_id: user.id, name: 'Foods', icon: 'burger.jpg')
    payment = Payment.create(name: 'Burger', author_id: user.id, amount: 100)
    CategoryPayment.new(category_id: category.id, payment_id: payment.id)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
