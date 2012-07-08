require 'spec_helper'

describe Message do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:content) }

  describe "#timestamp" do
    it "handles times today" do
      message = FactoryGirl.build_stubbed(:message)
      message.stub(:created_at) {DateTime.now.midnight + 7.hours}
      message.timestamp.should eql(" 7:00am")
    end

    it "handles times yesterday" do
      message = FactoryGirl.build_stubbed(:message)
      message.stub(:created_at) {DateTime.now.midnight - 7.hours}
      message.timestamp.should eql(" 5:00pm yesterday")
    end

    it "handles times further in the past" do
      message = FactoryGirl.build_stubbed(:message)
      message.stub(:created_at) {DateTime.new(2001,2,3,4,5,6)}
      message.timestamp.should eql(" 2:05pm,  3 Feb")
    end
  end
end