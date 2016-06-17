class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :url
      t.string :notes
      t.integer :type_id
      t.string :yelp_link
      t.string :opentable_link

      t.timestamps
    end
  end
end
