class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
    else
      redirect_to my_portfolio_path
      return
    end

    if !@stock
      flash.now[:error] = 'Stock ticker cannot be found'
    end
    render 'users/my_portfolio'
  end
end
