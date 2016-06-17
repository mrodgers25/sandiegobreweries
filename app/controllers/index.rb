get '/' do
  @places = Place.all
  @category = Category.all
  erb :index
end
