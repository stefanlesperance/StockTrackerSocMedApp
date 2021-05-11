class StocksController < ApplicationController
  
	def search
		if params[:stock].present?
			@stock = Stock.new_lookup(params[:stock])
			render json: @stock 
		end
	end
end
