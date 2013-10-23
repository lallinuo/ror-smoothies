class Ingredient < ActiveRecord::Base
  attr_accessible :availability, :name, :price
  has_many :recipes
  has_many :smoothies, :through =>:recipes
end
