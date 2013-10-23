class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    return User.find(session[:user_id]) if session[:user_id]
    nil
  end

  def make_new_recipe(ingredient_ids,smoothie)
     smoothie.recipes.each{|r|
     r.delete
     }
    ingredient_ids.each{|id|
      recipe = Recipe.new
      ingredient = Ingredient.find(id)
      ingredient.recipes << recipe
      smoothie.recipes << recipe
      recipe.save

    }
  end

end
