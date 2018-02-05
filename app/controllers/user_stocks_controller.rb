class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:stock])
    if !stock.present?
      stock = Stock.new_from_lookup(params[:stock])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "#{stock.ticker} added to your portfolio"
    redirect_to my_portfolio_path
  end
end
