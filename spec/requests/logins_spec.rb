require 'spec_helper'

describe "Guests" do
  it "see 'Sign in'" do

    visit root_path
    page.should have_content("Sign in")
  end

  it "are redirected to /sign_in" do
    visit root_path

    current_path.should == sign_in_path
  end
end

describe "Signed in users" do
  before(:each) do
    @user = FactoryGirl.create(:user, email: "demo@example.com", password: "demo123")
    visit sign_in_path
    fill_in 'Email', with: "demo@example.com"
    fill_in 'Password', with: "demo123"
    click_button 'Sign in'
  end

  it "see their email address" do
    visit root_path
    page.should have_content("demo@example.com")
  end

  it "see their messages" do
    @user.messages.create(content: "Here's a lovely message.")

    visit root_path
    page.should have_content("Here's a lovely message.")
  end

  it "can create new messages", js: true do
    visit root_path
    fill_in 'message_content', with: "My new message."
    click_button 'Send'

    find("#messages").should have_content("My new message.")
  end

  it "puts new messages at the top", js: true do
    FactoryGirl.create_list(:message, 5)

    visit root_path
    fill_in 'message_content', with: "The top message."
    click_button 'Send'

    find("#messages").find(".message").should have_content("The top message.")
  end

  it "see their email on messages they post" do
    @user.messages.create(content: "Another message.")

    visit root_path
    find('.message .author-email').should have_content('demo@example.com')
  end

  it "see the timestamp on messages they post" do
    @user.messages.create(content: "Yet another message.")

    visit root_path
    page.should have_css('.message .timestamp')
  end
end