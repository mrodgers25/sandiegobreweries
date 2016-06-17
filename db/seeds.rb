require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'gaslamplist_2015.csv'))

# csv = CSV.parse(csv_text, , :encoding => 'ISO-8859-1')

CSV.foreach('db/gaslamplist_2015.csv', :headers => true) do |row|

  Place.find_or_create_by({name: row[0]}) do |g|
    g.name = row[1]
    g.url = row[2]
    g.notes = row[3]
    g.category_id = row[4]
  end
end

CSV.foreach('db/food_type.csv', :headers => true) do |row|

  Category.create do |g|
    g.name = row[1]
    g.color = row[2]
  end
end



