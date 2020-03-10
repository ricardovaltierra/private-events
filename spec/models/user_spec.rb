require 'rails_helper'

RSpec.describe User, type: :model do

    let(:test_user) { User.create(username: "Example User") }
    let(:subject) { described_class.new(username: "user_example")}

  describe "validations" do
    it "is valid with valid attribute" do
        expect(subject).to be_valid
    end

    it "should not allow a name longer than 50 characters" do
      subject.username = 'a' * 51
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do    
    it { should have_many(:created_events) }
    it { should have_and_belong_to_many(:attended_events) }
  end
end
