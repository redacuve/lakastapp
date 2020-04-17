require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) do
    User.create(name: 'example_user', username: 'example', email: 'user@email.com')
  end

  let(:user3) do
    User.new(name: 'example_user_3', username: 'example2', email: 'user_3@email.com')
  end

  it 'is not valid without an name' do
    user3.name = ''
    expect(user3).to_not be_valid
  end

  it 'is saved even if the email is in uppercase' do
    user3.email.upcase!
    user3.save
  end
end