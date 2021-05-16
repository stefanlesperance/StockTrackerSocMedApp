class Stock < ApplicationRecord
	has_many :user_stocks
	has_many :users, through: :user_stocks


	#Tests a name and ticker symbol exist for each Stock, prior to it being saved to the database.
	#Why not price? Because it's changeable/mutable etc.
	validates :name, :ticker, presence: true

	#adding self. in front of it makes it a class method - there is no need to worry about an instance.
	#No depending on a variable
	#Should review the various options and what they are good for.
	#Far too often I just default to what I regularly use without thought
	def self.new_lookup(ticker_symbol)
		client = IEX::Api::Client.new(
		  publishable_token: "Tpk_ed4d9e67e0f04eadb7133ad96551debf",
		  endpoint: 'https://sandbox.iexapis.com/v1'
		)
		#in Ruby, the return is implied via last statement
		begin
			new(ticker: ticker_symbol, 
				name: client.company(ticker_symbol).company_name,
				 last_price: client.price(ticker_symbol))

			rescue => exception
				return nil
		end
	end

	def self.check_db(ticker_symbol)
		#It is not Stock.where, because we are already in the model.
		#Therefore Stock is implied.
		where(ticker: ticker_symbol).first
	end
end