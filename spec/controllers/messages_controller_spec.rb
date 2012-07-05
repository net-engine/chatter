require 'spec_helper'

describe MessagesController do
  describe "GET index as an authenticated user" do
    before(:each) do
      sign_in
    end

    it "assigns @messages" do
      user = FactoryGirl.create(:user)
      message = user.messages.create(content: "Some message here")
      get :index
      assigns(:messages).should eq([message])
    end

    it "orders @messages from newest to oldest" do
      message1 = FactoryGirl.create(:message)
      message2 = FactoryGirl.create(:message)
      message3 = FactoryGirl.create(:message)
      get :index
      assigns(:messages).should eq([message3, message2, message1])
    end

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
  end

  describe "POST create as an authenticated user" do
    before(:each) do
      sign_in
    end

    it "assigns @message" do
      post :create, :message => {content: "Message content"}, :format => 'js'
      assigns(:message).should be_a(Message)
    end
  end
end