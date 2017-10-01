class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :"figures/index"
  end

  get '/figures/new' do
   @figure = Figure.all
   @landmark = Landmark.all
   @title = Title.all
    erb :"figures/new"
  end

  get '/figures/:id' do

    @figure = Figure.find_by_id(params[:id])


    erb :"/figures/show"
  end

  post '/figures' do
    @figure= Figure.new(params[:figure])
    if params[:title][:name] != nil
     @figure.titles << Title.create(name: params[:title][:name])
    end
    if params[:landmark][:name] !=nil
    @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end

    @figure.save
    redirect to "/figures"
  end


  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @title = Title.all
    @landmark = Landmark.all
    erb :"/figures/edit"

  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    if params[:landmark][:name] != nil
    @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

end
