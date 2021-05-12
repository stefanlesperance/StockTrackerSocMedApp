class StocksController < ApplicationController
  
	def search
		#Check for the presence of params. His idea, not mine, should have thought of it.
		#Best option - it ensures we do not make a useless API call.
		if params[:stock].present?
			#if @stock is effectively a method of checking it exists - if it is not nil, then it would default elsewhere.
			#Ironically, it worked without the return 
			@stock = Stock.new_lookup(params[:stock])
			if @stock
				respond_to do |format|
					format.js {render partial: 'users/result'}
				end
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
