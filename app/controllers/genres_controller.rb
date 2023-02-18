class GenresController < ApplicationController
  before_action :authenticate_user!

  def index 
    @genres = Genre.where(user_id: current_user.id)
    
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to setting_path
    else
      render :new
    end

  end

  def setting
    
  end

  def destroy
    @genre = Genre.find(params[:id])
    if @genre.user_id == current_user.id
      @genre.destroy
      redirect_to setting_path
    else
      redirect_to setting_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:g_name).merge(user_id: current_user.id)
  end

end
