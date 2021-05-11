class StocksController < ApplicationController
  
	def search
		if params[:stock].present?
			if @stock
				@stock = Stock.new_lookup(params[:stock])
				render 'users/my_portfolio'
			else
				flash[:alert] = "That stock does not exist"
				render 'users/my_portfolio'
			end
		else
			flash[:alert] = "Please enter a Stock symbol"
			render 'users/my_portfolio'			
		end
	end
end
