get '/' do
  @restaurants = Restaurant.all
  erb :arcgis
end
