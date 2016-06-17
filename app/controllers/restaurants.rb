#create restaurant
#After create the restaurant create form should be hidden
post '/restaurants' do
  @restaurant = Restaurant.create(params)
  if @restaurant.valid?
    redirect '/'
  else
    redirect '/restaurants/new'
  end
end

#new
get '/restaurants/new' do
 erb :'/restaurants/new'
end

#Edit
get '/restaurants/:id/edit' do
  @restaurant = Restaurant.find(params[:id])
  erb :'/restaurants/edit'
end

#Delete
delete '/restaurants/:id' do
  restaurant = Restaurant.find(params[:id])
  restaurant.destroy!
  redirect '/'
end

#Show
get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :"/restaurants/show" , local: {restaurant: @restaurant}
end

# new review for particular restaurant
get '/restaurants/:id/reviews/new' do
  @restaurant = Restaurant.find(params[:id])
  @review = Review.new(restaurant_id: params[:id])
  # add ajax call here!
  if request.xhr?
    erb :'/restaurants/new_review', layout: false
  else
    erb :"/restaurants/new_review", locals:  {restaurant: @restaurant}
  end
end

#create review
post '/restaurants/:id/reviews' do
  @review = Review.create(rating: params[:rating], body: params[:body], user_id: current_user.id, restaurant_id: params[:id])
  if @review.valid?
    redirect '/'
  else
    redirect '/'
  end
end


