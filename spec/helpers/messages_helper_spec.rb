require 'spec_helper'

describe MessagesHelper do
  describe "#message_timestamp" do
    it "handles times today" do
      message = FactoryGirl.build_stubbed(:message)
      message.stub(:created_at) {DateTime.now.midnight + 7.hours}
      assign(:message, message)
      helper.message_timestamp.should eql(" 7:00am")
    end

    it "handles times today" do
      message = FactoryGirl.build_stubbed(:message)
      message.stub(:created_at) {DateTime.now.midnight - 7.hours}
      assign(:message, message)
      helper.message_timestamp.should eql(" 5:00pm yesterday")
    end

    it "handles times today" do
      message = FactoryGirl.build_stubbed(:message)
      message.stub(:created_at) {DateTime.new(2001,2,3,4,5,6)}
      assign(:message, message)
      helper.message_timestamp.should eql(" 2:05pm,  3 Feb")
    end
  end
end
