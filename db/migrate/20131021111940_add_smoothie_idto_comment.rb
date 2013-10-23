class AddSmoothieIdtoComment < ActiveRecord::Migration
  def up
    add_column :comments, :smoothie_id, :integer
  end

  def down
  end
end
