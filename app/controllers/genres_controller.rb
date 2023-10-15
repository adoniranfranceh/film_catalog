class GenresController < ApplicationController
	before_action :set_genre, only: [:edit, :update, :show]
  def index
  	@genres = Genre.all
  end

  def new
  	@genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)

  	if @genre.save
  		return redirect_to genre_path(@genre.id)
  	end

  	render :new
  end

  def edit; end

  def update
  	if @genre.update(genre_params)
  		return redirect_to genre_path(@genre.id)
  	end

  	render :edit
  end

  def show; end

  private

  def set_genre
  	@genre = Genre.find(params[:id])
  end

  def genre_params
  	params.require(:genre).permit(:name)
  end
end