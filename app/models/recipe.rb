class Recipe < ActiveRecord::Base
  attr_accessible :ingredient_id, :smoothie_id, :smoothie, :ingredient
  belongs_to :smoothie
  belongs_to :ingredient
end
