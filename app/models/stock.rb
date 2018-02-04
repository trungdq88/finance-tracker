class Stock < ApplicationRecord
  def self.new_from_lookup(ticker)
    stock = StockQuote::Stock.quote(ticker)
    price = stock.l.gsub(',', '').to_d
    new(name: stock.name, ticker: stock.symbol, last_price: price)
  end
end
