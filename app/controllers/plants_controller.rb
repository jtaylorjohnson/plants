class PlantsController < ApplicationController

  # GET: /plants
  get "/plants" do
    redirect_if_not_logged_in
    @plants = Plant.all
    erb :'plants/index'
  end

  # GET: /plants/new
  get "/plants/new" do
    redirect_if_not_logged_in
    erb :"/plants/new"
  end

  # POST: /plants
  post "/plants" do
    redirect_if_not_logged_in
    Plant.create(params)
    redirect "/plants"
  end

  # GET: /plants/5
  get "/plants/:id" do
    redirect_if_not_logged_in
    @plant = Plant.find(params[:id])
    erb :"/plants/show.html"
  end

  # GET: /plants/5/edit
  get "/plants/:id/edit" do
    redirect_if_not_logged_in
    @plant = Plant.find(params[:id])
    erb :"/plants/edit.html"
  end

  # PATCH: /plants/5
  post "/plants/:id" do
    redirect_if_not_logged_in
    @plant = Plant.find(params[:id])
    @plant.update(params.select{|p|p=="name" || p=="type"})
    redirect "/plants/#{@plant.id}"
  end

end
