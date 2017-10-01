class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :"landmarks/index"
  end

  get '/landmarks/new' do
    @landmark = Landmark.all

    erb :"landmarks/new"
  end

  post '/landmarks' do
    @landmark = Landmark.create(name:params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    @landmark.save

    redirect to '/landmarks'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :"landmarks/show"

  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :"landmarks/edit"

end

patch '/landmarks/:id' do
  @landmark = Landmark.find_by_id(params[:id])
  @landmark_integer = params[:landmark][:year_completed].to_i
  @landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
  @landmark.save

  redirect to "/landmarks/#{@landmark.id}"
end

end
