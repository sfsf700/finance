class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_genres, only: [:create]
  before_action :set_params, only: [:edit, :update, :destroy]

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

    @incomes = Record.all.where(user_id: current_user.id).where(status: 2).group(:r_date).sum(:price)
    @spendings = Record.all.where(user_id: current_user.id).where(status: 1).group(:r_date).sum(:price)
    @total = @incomes.merge(@spendings){|key, v1, v2| v1 + v2}
    @items = @total.merge(@spendings){|key, v1, v2| v1 - v2 - v2}
  end


  def edit
    @genres = Genre.where(user_id: current_user.id)
  end

  def update
    
    @record.update(record_params)
    if @record.valid?
      redirect_to records_path
    else
      render :edit
    end
  end

  def destroy
    if @record.user_id == current_user.id
      @record.destroy
      redirect_to records_path
    else
      redirect_to root_path
    end
  end

  private 
  def record_params
    params.require(:record).permit(:memo, :price, :genre_id, :r_date, :status).merge(user_id: current_user.id)
  end

  def set_params
    @record = Record.find(params[:id])
  end

  def set_genres
    @genres = Genre.where(user_id: current_user.id)
  end

end
