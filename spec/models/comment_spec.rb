require 'spec_helper'

describe Comment do
  before :each do
    @user = User.new :username => "Pekka", :password => "salasana"

  end
  it "is saved to database when it is valid" do
    comment = Comment.new :comment => "kommentti", :user_id => @user.id, :rating => 4
    comment.save
    Comment.count.should == 1
  end
  it "has the right message" do
    comment = Comment.new :comment => "kommentti", :user_id => @user.id, :rating => 4

    @user.username.should == "Pekka"
    comment.comment.should == "kommentti"
  end

  it "is linked with the right user" do
    comment = Comment.new :comment => "kommentti", :user=> @user.id, :rating => 4

    comment.user ==@user
  end

  it "is not valid without comment"  do
    comment = Comment.new :comment => "", :user=> @user.id, :rating => 4
    comment.valid?.should == false
  end

  it "is not valid without user" do
    comment = Comment.new :comment => "", :rating => 4
    comment.valid?.should == false

  end

end