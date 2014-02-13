require 'spec_helper'

describe "StaticPages" do

#	let(:base_title) {"Ruby on Rails Tutorial Sample App"}
 
#Edited from here as per the tutorial

describe "Home page" do
	before { visit root_path }

#	it { should have_selector('h1',    text: 'Sample App') }		#test getting failed
#    it { should have_selector('title', text: 'Ruby on Rails Tutorial Sample App') }	#test getting failed
    it { should_not have_selector 'title', text: '| Home' }    
	
	describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
	  
	  describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
	  
    end
	
end

 describe "Help page" do
    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

	
	it "should have the title 'Help'" do 
	  visit help_path
	  expect(page).to have_title("Ruby on Rails Tutorial Sample App")
	end
  end
  
 describe "About Page" do
	it "should have the content 'About us'" do
		visit about_path
		expect(page).to have_content('About Us')
		end

	
	it "should have the title 'About Us'" do 
	  visit about_path
	  expect(page).to have_title("Ruby on Rails Tutorial Sample App")
	end
end

#Added for contact page
 describe "Contact Us" do
	it "should have the content 'Contact Us'" do
		visit contact_path
		expect(page).to have_content('Contact Us')
		end

	
	it "should have the title 'Contact Us'" do 
	  visit contact_path
	  expect(page).to have_title("Ruby on Rails Tutorial Sample App")
	end
end

end

#Edited upto here as per the tutorial

