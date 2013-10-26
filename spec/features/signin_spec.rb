require 'spec_helper'

describe "Signin " do
      it "works" do
        user = User.create :username => "testi", :password =>"salasana"

        visit smoothies_path
        fill_in("username", :with =>"testi")
        fill_in("password", :with =>"salasana")
        click_button "Log in"
        expect(page).to have_content "Welcome"
      end

end