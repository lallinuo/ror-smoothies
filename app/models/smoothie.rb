class Smoothie < ActiveRecord::Base
  attr_accessible :desc, :rating, :url, :user_id, :name, :user
  has_many :comments, :dependent => :destroy
  has_many :recipes, :dependent => :destroy

  has_many :ingredients, :through => :recipes
  belongs_to :user
  validates_length_of :desc, :minimum => 1, :maximum => 1500

  validates_uniqueness_of :name
  validates_format_of :url, :with => /http:\/\/i.imgur.com\/........jpg/i, :message => "is invalid. Please upload your images to http://www.imgur.com with .jpg extension"
  validates_numericality_of :rating, { :greater_than_or_equal_to => 1,
                                      :less_than_or_equal_to => 10,
                                      :only_integer => true
  }
end
