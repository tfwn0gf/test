 class MoviesController < ApplicationController
   
   
   def index
     @movies = Movie.all
   end
   
   def show
    @movie = Movie.find(params[:id])
   end
   
   def new
    @movie = Movie.new
   end
   
   
   def create
    @movie = Movie.new(movie_params)
    @movie.user = User.find(1)
    
    if @movie.save 
     flash[:success] = "Twoj film zostal dodany ! "
     redirect_to movies_path
    else
     render :new
    end
   end
   
   def edit
    @movie = Movie.find(params[:id])
   end


   def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
     flash[:sucess] = "Twoj film zostal zedytowany"
     redirect_to movie_path(@movie)
    else
     render :edit
    end
   end
   
   
   
     private
     def movie_params
      params.require(:movie).permit(:name,:rating)
     end
   
 end