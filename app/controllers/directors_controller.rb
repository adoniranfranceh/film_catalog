class DirectorsController < ApplicationController
	before_action :set_director, only: [:edit, :update, :show]
  def index
  	@directors = Director.all
  end

  def new
  	@director = Director.new
  end

  def create
  	@director = Director.new(director_params)

  	if @director.save
  		return redirect_to director_path(@director.id)
  	end

  	render :new
  end

  def edit; end

  def update
  	if @director.update(director_params)
  	  return redirect_to director_path(@director.id)
  	end

  	render :edit
  end

  def show; end

  private

  def set_director
  	@director = Director.find(params[:id])
  end

  def director_params
  	params.require(:director).permit(:name, 
                                     :nationality, 
                                     :birthday, 
                                     :genre_id)
  end
end
