get '/' do
  @places = Place.all
  erb :index
end
