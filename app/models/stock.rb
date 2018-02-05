class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.find_by_ticker(ticker)
    where(ticker: ticker).first
  end

  def self.new_from_lookup(ticker)
    begin
      stock = StockQuote::Stock.quote(ticker)
      price = stock.l.gsub(',', '').to_d
      new(name: stock.name, ticker: stock.symbol, last_price: price)
    rescue Exception => e
      logger.debug e
      nil
    end
  end
end
