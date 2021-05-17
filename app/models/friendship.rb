class Friendship < ApplicationRecord
  belongs_to :user
  #It belongs to friend, but the class name isn't friend, but User, again referring back to itself.
  belongs_to :friend, class_name: 'User'



   def friend_already_tracked?(email)
   	# BIG NOTE - Using the console and running things from there, methods can be brought into this.
   	# It's a good trainee method, I think.
   	#Not in stock class, ergo, need to type Stock
   	#First check if the stock exists in the Database
   	user = Stock.check_db(ticker_symbol)
   	return false unless stock
   	#Is the user tracking this stock?
   	stocks.where(id: stock.id).exists?
   end


   def check_friend_list(email)
   		friends.where(email: email).first
   end

end
