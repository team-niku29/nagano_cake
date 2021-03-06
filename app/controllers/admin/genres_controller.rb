class Admin::GenresController < ApplicationController

  before_action :authenticate_admin!

  layout 'admin'

  def index
    per = 10
  	@genre = Genre.new
  	@genres = Genre.page(params[:page]).per(per)
  end

  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
  	redirect_to admin_genres_path
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	@genre.update(genre_params)
  	redirect_to admin_genres_path
  end

  private
  def genre_params
  	params.require(:genre).permit(:name, :invalid_status)
  end
end