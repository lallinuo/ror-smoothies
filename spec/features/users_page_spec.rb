require 'spec_helper'

describe "User page" do
  before :each do
    @user = User.create :username => "Pekka", :password => "salasana"
    @smoothie = Smoothie.create :desc => "resepti", :user => @user,:url =>"http://i.imgur.com/HiNJ3pa.jpg", :rating => 5, :name => "asd"


  end
  it "contains link to users page"  do
    visit users_path
    click_link "Pekka"
  end
  it "contains link to users smoothies" do
    visit users_path
    click_link "Pekka"
    expect(@smoothie).to be_valid
    expect(page).to have_content "asd"
  end

end