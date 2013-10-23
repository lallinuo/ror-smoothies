class CreateSmoothies < ActiveRecord::Migration
  def change
    create_table :smoothies do |t|
      t.text :desc
      t.string :url
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end
end
