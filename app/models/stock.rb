class Stock < ApplicationRecord

	#adding self. in front of it makes it a class method - there is no need to worry about an instance.
	#No depending on a variable
	#Should review the various options and what they are good for.
	#Far too often I just default to what I regularly use without thought
	def self.new_lookup(ticker_symbol)
		client = IEX::Api::Client.new(
		  publishable_token: Rails.application.credentials[:sandbox_api_key],
		  endpoint: 'https://sandbox.iexapis.com/v1'
		)
		#in Ruby, the return is implied via last statement
		new(ticker: ticker_symbol, 
			name: client.company(ticker_symbol).company_name,
			 last_price: client.price(ticker_symbol))
	end
end