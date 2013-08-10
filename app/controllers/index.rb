
get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sign_up' do
  erb :sign_up
end

get '/sign_out' do
  session.clear
  redirect ('/')
end

get '/secret' do
  if session[:user_id]
    erb :secret 
  else
    erb :index
  end
end

post '/sign_up' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect('/')
  else
    erb :sign_up
  end

  
  # if params[:user][:password].blank?  (confirm password is entered - not a blank string)
  #   erb :sign_up
  # else
  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect('/')
  #   else
  #     erb :sign_up
  #   end
  # end
end

post '/sign_in' do
  if @user = User.authenticate(params[:email], params[:password])
    session[:user_id] = @user.id
    redirect('/')
  else
    redirect('/')
  end
end
