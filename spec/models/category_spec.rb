require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    user = User.create(name: 'Charles')
    payment = Payment.create(name: 'Burger', author_id: user.id, amount: 100)
    Category.new(author_id: user.id, payment_id: payment.id, name: 'Foods', icon: 'burger.jpg')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
