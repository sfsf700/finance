class GenresController < ApplicationController
  require 'csv'
  
  def new
    @genres = Genre.where(user_id: current_user.id)
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to new_genre_path
    else
      render :new
    end
  end

  def setting
    
  end

  def index

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
      redirect_to new_genre_path
    else
      redirect_to new_genre_path
    end
  end

  def csv
    @records = Record.all.where(user_id: current_user.id).order(r_date: :desc)
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_finance_csv(@records)
      end
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:g_name).merge(user_id: current_user.id)
  end


  def send_finance_csv(records)
    csv_data = CSV.generate do |csv|
      column_names = %w(日付 金額 カテゴリー 収支)
      csv << column_names
      records.each do |record|
        if record.status == 1
          column_values = [
            record.r_date,
            record.price,
            record.genre.g_name,
            record.status = "支出",
          ]
        else
          column_values = [
            record.r_date,
            record.price,
            record.genre.g_name,
            record.status = "収入",
          ]
        end
        csv << column_values
      end
    end
    @user = current_user.name
    send_data(csv_data, filename: "#{@user}の家計簿.csv")
  end

end
