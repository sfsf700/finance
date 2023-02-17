class RecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @record = Record.new
    @genres = Genre.where(user_id: current_user.id)
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to root_path
    else
      render :new
    end
  end

  def setting
  end

  def index

    date = params[:start_date]
    
    s = date.to_date
    sta_day = s.beginning_of_month
    end_day = s.end_of_month
    
    @items = Record.all.where(user_id: current_user.id).group(:r_date).sum(:price)
    @records = Record.includes(:user).order('r_date DESC').where(user_id: current_user.id).where(r_date: sta_day..end_day)
    
    @select_income = Record.where(status: 2).where(user_id: current_user.id).where(r_date: sta_day..end_day).sum(:price) 
    @select_spending = Record.where(status: 1).where(user_id: current_user.id).where(r_date: sta_day..end_day).sum(:price) ## 支出合計
    
  end

  private 
  def record_params
    params.require(:record).permit(:memo, :price, :genre_id, :r_date, :status).merge(user_id: current_user.id)
  end


end
