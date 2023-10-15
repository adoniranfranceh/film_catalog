class FilmsController < ApplicationController
  before_action :set_film, only: [:edit, :update, :show]
  def index
    @films = Film.all
  end
  def new
  	@film = Film.new
  end

  def create
  	@film = Film.new(film_params)

  	if @film.save
  		return redirect_to film_path(@film.id)
  	end

  	render :new
  end

  def edit; end

  def update
  	if @film.update(film_params)
  		return redirect_to film_path(@film.id)
  	end

  	render :edit
  end

  def show; end

  def publish
    film = Film.find(params[:id])
    film.published!
    redirect_to film_path(film.id)
  end

  def draft
    film = Film.find(params[:id])
    film.draft!
    redirect_to film_path(film.id)
  end

  private

  def set_film
  	@film = Film.find(params[:id])
  end

  def film_params
  	params.require(:film).permit(:title, 
                                 :release_year, 
                                 :synopsis, 
                                 :country_of_origin, 
                                 :duration, 
                                 :director_id, 
                                 :genre_id,
                                 :poster)
  end
end
