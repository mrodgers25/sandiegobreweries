require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'gaslamplist_2015.csv'))

# csv = CSV.parse(csv_text, , :encoding => 'ISO-8859-1')

CSV.foreach('db/gaslamplist_2015.csv', :headers => true) do |row|

  Place.find_or_create_by({name: row[0]}) do |g|
    g.name = row[0]
    g.url = row[1]
    g.notes = row[2]
    g.type_id = row[3]
  end
end




