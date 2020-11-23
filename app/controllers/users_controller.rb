class UsersController < ApplicationController

  get '/users/:id' do
    if !logged_in?
      redirect '/plants'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/plants'
    end
  end

  get '/signup' do
      erb :'users/new'
  end

  post '/signup' do 
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/plants'
    end
  end

  get '/login' do 
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/plants'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/plants"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
      session.destroy
      redirect to '/login'
  end

end
