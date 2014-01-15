require 'spec_helper'

describe "User pages" do
  #describe "GET /user_pages" do
    #it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #get user_pages_index_path
      #response.status.should be(200)
    #end
	
	subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign Up') }
    it { should have_selector('title', text: full_title('Sign Up')) }
	
  end	
end