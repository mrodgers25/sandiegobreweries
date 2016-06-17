class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :body
      t.integer :user_id, :null => false
      t.integer :restaurant_id, :null => false

      t.timestamps
    end
  end
end
