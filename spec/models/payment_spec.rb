require 'rails_helper'

RSpec.describe Payment, type: :model do
  subject do
    user = User.create(name: 'Charles')
    Payment.new(name: 'Burger', author_id: user.id, amount: 100)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with amount less than zero' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end
