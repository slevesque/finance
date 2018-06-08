class Stock < ApplicationRecord
  def self.new_from_lookup(ticker_symbol)
    begin
      ret = StockQuote::Stock.quote(ticker_symbol)
      price = strip_commas(ret.latest_price)
      new(name: ret.company_name, ticker: ret.symbol, last_price: price)
    rescue Exception => e
      return nil
    end
  end

  def self.strip_commas(number)
    number.to_s.gsub(",", "")
  end
end
