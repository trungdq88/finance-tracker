class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:error] = 'Please enter a ticker to search'
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:error] = "\"#{params[:stock]}\" cannot be found" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end
