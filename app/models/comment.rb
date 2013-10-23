class Comment < ActiveRecord::Base
  attr_accessible :comment, :rating, :user_id, :smoothie_id
  belongs_to :user
  validates_length_of :comment, :minimum => 1, :maximum => 500
  validates_numericality_of :rating, { :greater_than_or_equal_to => 1,
                                      :less_than_or_equal_to => 50,
                                      :only_integer => true
  }
end
