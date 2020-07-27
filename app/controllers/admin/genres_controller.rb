class Admin::GenresController < ApplicationController

  before_action :authenticate_admin!

  layout 'admin'  
  
  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
  	redirect_to admin_genres_path
  end

  def edit
  	@genre = Genre.find(1)
  end

  def update
  	@genre = Genre.find_by(params[:id])
  	@genre.update(genre_params)
  	redirect_to admin_genres_index_path
  end

  private
  def genre_params
  	params.require(:genre).permit(:name, :invalid_status)
  end
end