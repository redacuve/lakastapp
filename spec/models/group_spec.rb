require 'rails_helper'
RSpec.describe Group, type: :model do
  let(:user1) do
    User.create(name: 'example_user', username: 'example', email: 'user@email.com')
  end

  let(:record1) do
    Record.new(name: 'second', minutes: 45, author: user1)
  end

  subject do
    described_class.new(name: 'example', user: user1)
  end

  it 'a group is saved' do
    subject.save(validate: false)
    expect(Group.all.count).to eq(1)
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an icon' do
    expect(subject).to_not be_valid
  end

  it 'shows the number of the record to the group' do
    subject.save(validate: false)
    record1.group = subject
    record1.save
    expect(subject.records.count).to eq(1)
  end
end
