class FinancesController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def setting
  end
end
