class HomeController < ApplicationController
  def index
  	@films = Film.published
  end
end