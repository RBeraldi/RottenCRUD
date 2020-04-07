class ReviewsController < ApplicationController


    def new
      
    end

    def create
      movie_id = params[:movie_id]
      user_id = session[:user_id]
      @movie = Movie.find(movie_id) 
      #if not movie ... #How is this possible? 
      @review = Review.new(params[:review].permit(:potatoes,:comments))

      @review.moviegoer_id = user_id
      @review.movie_id = movie_id
      @review.save!
      redirect_to movie_path(@movie)
      
    end


end
