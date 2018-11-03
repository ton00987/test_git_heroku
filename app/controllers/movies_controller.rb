# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  
  def show
    id = params[:id] # retrieve movie ID from URI route
    # if id > Movie.all.count
    #   redirect('/movie')
    # end
    begin
      @movie = Movie.find(id) # look up movie by unique ID
    rescue ActiveRecord::RecordNotFound
      redirect_to :action => 'index'
    end
    # will render app/views/movies/show.html.haml by default
  end
end