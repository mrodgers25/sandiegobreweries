class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :type
      t.string :color
      t.integer :places_id

      t.timestamps
    end

  end
end
