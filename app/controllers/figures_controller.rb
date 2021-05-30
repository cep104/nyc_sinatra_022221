class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index.html'
  end
  
  get '/figures/new' do 
  @titles = Title.all 
  @landmarks = Landmark.all
  erb :'figures/new.html'
  end

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show.html'
  end

  post '/figures' do 
    @figure = Figure.new(params[:figure])
   
    if !params[:title][:name].blank? 
      # binding.pry
      @figure.titles.build(params[:title])
    end
    if !params[:landmark][:name].blank? 
      # binding.pry
      @figure.landmarks.build(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{figure.id}"
  # binding.pry
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    @titles = Title.all 
    @landmarks = Landmark.all
    erb :'figures/edit.html'
  end

  patch '/figures/:id' do 
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    # binding.pry
    if !params[:title][:name].blank? 
      @figure.titles.build(params[:title])
      @figure.save
    end
    if !params[:landmark][:name].blank? 
      # binding.pry
      @figure.landmarks.build(params[:landmark])
      @figure.save
      
    end
    redirect to "/figures/#{@figure.id}"
    # binding.pry

    # binding.pry
  end

end
