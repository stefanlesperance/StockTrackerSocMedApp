class UserStocksController < ApplicationController

	def create
		#creating an assocation
		#We get the stock from the params, which is passed along via the button
		#We can use this stock = Stock.new_lookup(params[:ticker])
		#But notice that new_lookup really works best if the stock is not already present - what if it IS present? 
		
		#New addition - Maximum ten tracked stocks, I can simple kill it off from here. If I can code it properly

		if current_user.stocks.count >= 10
			flash[:alert] = "You have reached the maximum number of allowable tracked stocks."
			redirect_to my_portfolio_path
		else

			#Database check method. See if the stock is in the Database
			stock = Stock.check_db(params[:ticker])
				#If it isn't we run the If Statement
			if stock.blank?
				#This looks up the Stock via IEX API
				stock = Stock.new_lookup(params[:ticker])
				#Then we save the stock to the database
				stock.save
				#Now we can pass both the User id, and the stock id, straight to the UserStocks table, creating the relationship
				@user_stock = UserStock.create(user: current_user, stock: stock)
				flash[:notice] = "Stock #{stock.name}was successfully added to your portfolio."
				redirect_to my_portfolio_path
			end
		end
	end

end
