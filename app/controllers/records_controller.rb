class RecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @record = Record.new
    @genres = Genre.all
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def setting
  end

  def index
    @records = Record.includes(:user).order('r_date DESC')
    
    @select_income = Record.where(status: 2).sum(:price) ## 収入合計
    @select_spending = Record.where(status: 1).sum(:price) ## 支出合計
    
  end

  private 
  def record_params
    params.require(:record).permit(:memo, :price, :genre_id, :r_date, :status).merge(user_id: current_user.id)
  end


end
