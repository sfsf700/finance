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


  def index

    now_day = Date.today
    sta = now_day.beginning_of_month
    end_day = now_day.end_of_month

    simplecalendar = params[:start_date]

    if simplecalendar != nil

      select_beg_day = simplecalendar.to_date.beginning_of_month
      select_end_day = simplecalendar.to_date.end_of_month

      @records = Record.includes(:user).order('r_date DESC').where(user_id: current_user.id).where(r_date: select_beg_day..select_end_day)
      @select_income = Record.where(status: 2).where(user_id: current_user.id).where(r_date: select_beg_day..select_end_day).sum(:price) ## 収入
      @select_spending = Record.where(status: 1).where(user_id: current_user.id).where(r_date: select_beg_day..select_end_day).sum(:price) ## 支出
    else
      @records = Record.includes(:user).order('r_date DESC').where(user_id: current_user.id).where(r_date: sta..end_day)
      @select_income = Record.where(status: 2).where(user_id: current_user.id).where(r_date: sta..end_day).sum(:price) ## 収入
      @select_spending = Record.where(status: 1).where(user_id: current_user.id).where(r_date: sta..end_day).sum(:price) ## 支出
    end

    @items = Record.all.where(user_id: current_user.id).group(:r_date).sum(:price)    
  end

  private 
  def record_params
    params.require(:record).permit(:memo, :price, :genre_id, :r_date, :status).merge(user_id: current_user.id)
  end


end
