require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:user1) do
    User.create(name: 'example_user', username: 'example', email: 'user@email.com')
  end

  let(:user2) do
    User.create(name: 'foo', username: 'foobar', email: 'foo@bar.biz')
  end

  let(:record2) do
    Record.create(name: 'second', minutes: 45, author: user2)
  end

  let(:group1) do
    Group.create(id: 1, name: 'malcom in the middle', icon: '{malcom.jpg}', user: user2)
  end

  subject do
    described_class.new(name: 'example', minutes: 15, author: user1, group: group1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without minutes' do
    subject.minutes = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without authorid' do
    subject.authorid = nil
    expect(subject).to_not be_valid
  end

  it 'should show the count if I created a new record' do
    subject.save
    expect(Record.mine(user1).count).to eq(1)
  end

  it 'should see the record on not_grouped if it is saved without group' do
    subject.group_id = nil
    subject.save
    expect(Record.mine(user1).grouped.count).to eq(0)
    expect(Record.mine(user1).not_grouped.count).to eq(1)
  end

  it 'should see the record on grouped if it is saved within a group' do
    subject.save
    expect(Record.mine(user1).not_grouped.count).to eq(0)
    expect(Record.mine(user1).grouped.count).to eq(1)
  end
end
