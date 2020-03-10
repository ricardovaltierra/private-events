require 'rails_helper'

RSpec.describe Event, type: :model do

    user = User.find_by(username: "Example User")
    subject { described_class.new(
                        name: "Ruby Meetup",
                        content: "Lorem ipsum",
                        location: "Brazil",
                        date: DateTime.now,
                        creator_id: user.id)
    }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a start_date" do
    subject.location = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a end_date" do
    subject.date = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should belong_to(:creator) }
    it { should have_and_belong_to_many(:attendees) }
  end
end
