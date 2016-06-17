# AUTH

get '/login' do
    @user = User.new
    erb :'users/login'
end

before '/login' do
    unless session[:user_id].nil?
        erb "some kind of landing page"
    end
end

post '/login' do
    user_hash = params[:user]
    puts "===========#{params}================="
    # user = User.authenticate(matcher: user_hash[:email], password: user_hash[:password]);
    user = User.authenticate(params[:user][:email], params[:user][:password])
    if user
        session[:user_id] = user.id
        redirect session[:last_page]
    else
        @user = User.new(user_hash)
        @user.errors.add(:email, "credentials don't match our records")
        erb :'users/login'
    end
end

get '/logout' do
    session[:user_id] = nil
    redirect session[:last_page]
end

get '/signup' do
    @user = User.new
    erb :'users/register'
end

post '/users' do
    @user = User.create(params[:user])
    if @user.valid?
        session[:user_id] = @user.id
        redirect session[:last_page]
    else
        erb :'users/register'
    end
end
