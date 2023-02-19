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

  def chart

    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today

    @select_income = Record.where(status: 2).where(user_id: current_user.id).where(r_date: @month.all_month).sum(:price)
    @select_spending = Record.where(status: 1).where(user_id: current_user.id).where(r_date: @month.all_month).sum(:price)

    @spe_total = Record.joins(:genre).where(r_date: @month.all_month).where(status: 1).where(user_id: current_user.id).group(:g_name).sum(:price)
    @inc_total = Record.joins(:genre).where(r_date: @month.all_month).where(status: 2).where(user_id: current_user.id).group(:g_name).sum(:price)
    
    @spending = Record.joins(:genre).where(status: 1).where(r_date: @month.all_month).where(user_id: current_user.id).group(:g_name).sum(:price).sort_by { |_, v| v }.reverse.to_h
    @income = Record.joins(:genre).where(status: 2).where(r_date: @month.all_month).where(user_id: current_user.id).group(:g_name).sum(:price).sort_by { |_, v| v }.reverse.to_h
    
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
