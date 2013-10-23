class AddNameForSmoothies2 < ActiveRecord::Migration
  def up
    add_column :smoothies, :name, :string

  end

  def down
  end
end
