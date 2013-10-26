require 'spec_helper'

describe "Signup page" do

  it "saves new user to database when form is sent when form is valid" do
      visit new_user_path
      fill_in("user_username", :with =>"testi")
      fill_in("user_password", :with =>"salasana")
      fill_in("user_password_confirmation",:with =>"salasana")
      expect{
        click_button('Create User')
      }.to change{User.count}.by(1)
  end

  it "doesn't save new user to database when form is sent when form is invalid" do
    visit new_user_path
    fill_in("user_username", :with =>"testi")
    fill_in("user_password", :with =>"salasana")
    fill_in("user_password_confirmation",:with =>"salasan")
    expect{
      click_button('Create User')
    }.to change{User.count}.by(0)
  end
end