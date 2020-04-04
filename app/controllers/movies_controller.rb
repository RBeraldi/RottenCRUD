class MoviesController < ApplicationController




    def index
        @movies = Movie.all
	end
    
    def show
        id = params[:id]
        if Movie.exists?(id)
            @movie = Movie.find(id)
        else
            render html: 'Movie does not exit'
        end
	end
    
    
	def new
		
	end
    

    def create
        @movie = Movie.new(params[:movie].permit!) 
        if @movie.save
            flash[:notice] = "Movie #{@movie.title} was added"
            redirect_to movies_path
        else
            flash[:notice] = @movie.errors.full_messages
            redirect_to movies_path
        end
    end


	
    def edit
        id = params[:id]
        @movie = Movie.find(id)
	end
    


	def update
        id = params[:id]
        @movie = Movie.find(id)
        @movie.update_attributes!(params[:movie].permit(:title, :rating, :description, :release_date))
		redirect_to movie_path(@movie)
	end

    
	def destroy
		id = params[:id]
		@movie = Movie.find(id)
		@movie.destroy
		redirect_to movies_path
    end
    
    def create2
        @movie = Movie.new(params[:movie].permit!)
        if @movie.save
            flash[:notice] = "Movie #{@movie.title} was added"
            redirect_to movies_path 
        else 
            flash[:notice] = @movie.errors.full_messages
            redirect_to movies_path
        end
    end

end