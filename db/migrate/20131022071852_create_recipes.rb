class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :ingredient_id
      t.integer :smoothie_id

      t.timestamps
    end
  end
end
