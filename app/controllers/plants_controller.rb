class PlantsController < ApplicationController


  get "/plants" do
    redirect_if_not_logged_in
    @user = current_user
    erb :'plants/index'
  end


  get "/plants/new" do
    redirect_if_not_logged_in
    erb :"/plants/new"
  end


  post "/plants" do
    redirect_if_not_logged_in
    plant = Plant.new(params)
    plant.user_id = session[:user_id]
    plant.save
    redirect "/plants"
  end


  get "/plants/:id" do
    redirect_if_not_logged_in
    @plant = Plant.find(params[:id])
    erb :"/plants/show"
  end


  get "/plants/:id/edit" do
    redirect_if_not_logged_in
    @plant = Plant.find(params[:id])
    if session[:user_id] == @plant.user_id
      erb :"/plants/edit"
    else
      "That's not your plant!"
    end
  end


  patch "/plants/:id" do
    redirect_if_not_logged_in
    plant = Plant.find(params[:id])
    if session[:user_id] == plant.user_id
      #plant.update(name: params["plant"]["name"], kind: params["plant"]["kind"])
      plant.update(params[:plant])
      redirect "/plants/#{plant.id}"
    else
      "That's not your plant!"
    end
  end

end
