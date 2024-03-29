require 'spec_helper'

describe MessagesController do
  render_views
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

    it "renders the index template as JSON" do
      get :index, format: 'json'
      response.should render_template("index")
    end

  end

  describe "POST create as an authenticated user" do
    before(:each) do
      sign_in
    end

    it "assigns @message" do
      post :create, message: {content: "Message content"}, format: 'js'
      assigns(:message).should be_a(Message)
    end
  end

  describe "SHOW JSON as an authenticated user" do
    let(:message) {FactoryGirl.create(:message)}
    before(:each) do
      sign_in
    end

    it "assigns @message" do
      get :show, id: message.id, format: 'json'
      assigns(:message).should be_a(Message)
    end

    it "renders the show template" do
      get :show, id: message.id, format: 'json'
      response.should render_template("show")
    end
  end
end