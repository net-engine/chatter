require 'spec_helper'

describe "Logins" do
  describe "it asks you to log in" do
    it "says 'Sign in' if you haven't" do

      visit root_path
      page.should have_content("Sign in")
    end

    it "redirects guests to sign in" do
      visit root_path

      current_path.should == sign_in_path
    end
  end
end
