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
end
