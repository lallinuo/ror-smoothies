class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  has_secure_password
  has_many :comments, :dependent => :destroy
  has_many :smoothies, :dependent => :destroy
  validates_uniqueness_of :username
  validates_length_of :password, :minimum => 6, :maximum => 100
  validates_length_of :username, :minimum => 1, :maximum => 25


end
