require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:test_user) { User.create(username: 'Example User') }
  let(:subject) do
    described_class.new(
      name: 'Ruby Meetup',
      content: 'Lorem ipsum',
      location: 'Brazil',
      date: DateTime.now,
      creator_id: test_user.id
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a content' do
      subject.content = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a location' do
      subject.location = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a date' do
      subject.date = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a creator_id' do
      subject.creator_id = nil
      expect(subject).to_not be_valid
    end

    it 'should not allow a name longer than 100 characters' do
      subject.name = 'a' * 101
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:creator) }
    it { should have_and_belong_to_many(:attendees) }
  end
end
