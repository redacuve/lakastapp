require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'example', username: 'example', email: 'example@mail.com')
  end

  let(:user1) do
    User.create(name: 'example_user', username: 'example', email: 'user@email.com')
  end

  let(:user3) do
    User.new(name: 'example_user_3', username: 'example2', email: 'user_3@email.com')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.email = ''
    expect(subject).to_not be_valid
  end

  it 'is not valid without a valid email' do
    subject.email = 'email.com'
    expect(subject).to_not be_valid
  end

  it 'is valid with a email and a whitespace at the end' do
    subject.email = 'example@mail.com '
    expect(subject).to be_valid
  end

  it 'is valid with a emain capitalized' do
    subject.email = 'Example@mail.com'
    expect(subject).to be_valid
  end

  it 'is not valid with a email bigger than 200 characters' do
    subject.email = "example@mail.co#{'m' * 200}"
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name bigger tan 100 characters' do
    subject.name = 'a' * 101
    expect(subject).to_not be_valid
  end

  it 'is not valid with a username bigger tan 50 characters' do
    subject.username = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'is not valid if there are the same email saved' do
    subject.save
    user = User.new(name: 'Other', username: 'other', email: 'example@mail.com')
    expect(user).to_not be_valid
  end

  it 'is not valid if there are the same username saved' do
    subject.save
    user = User.new(name: 'Other', username: 'example', email: 'other@mail.com')
    expect(user).to_not be_valid
  end
end
