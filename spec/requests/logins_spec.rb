require 'spec_helper'

describe "Logins" do
  describe "it asks you to log in" do
    it "says 'Sign in' if you haven't" do

      visit root_path
      page.should have_content("Sign in")
    end
  end
end
