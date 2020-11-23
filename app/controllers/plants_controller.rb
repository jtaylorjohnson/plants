class PlantsController < ApplicationController


  get "/plants" do
    redirect_if_not_logged_in
    @plants = Plant.all
    erb :'plants/index'
  end


  get "/plants/new" do
    redirect_if_not_logged_in
    erb :"/plants/new"
  end


  post "/plants" do
    redirect_if_not_logged_in
    Plant.create(name:)
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
    erb :"/plants/edit"
  end


  post "/plants/:id" do
    redirect_if_not_logged_in
    @plant = Plant.find(params[:id])
    @plant.update(params.select{|p|p=="name" || p=="kind"})
    redirect "/plants/#{@plant.id}"
  end

end
