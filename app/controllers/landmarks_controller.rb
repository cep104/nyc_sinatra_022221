class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do 
    @figures = Figure.all 
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all 
    erb :'/landmarks/edit'
  end

  post '/landmarks' do 
    @landmark = Landmark.new(params[:landmark])
    # binding.pry
    if !params[:figure][:name].blank? 
      # binding.pry
      @landmark.build(params[:figure])
    end
    
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  patch '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    # binding.pry
    if !params[:figure][:name].blank? 
      @landmark.figure(params[:figure])
      @landmark.save
    end
     
    redirect to "/landmarks/#{@landmark.id}"
    # binding.pry
  end
end
