class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  #The code below appears identical to the code above
  #Yet, if you look in the Friendship Model, you will see that Friendship belongs_to :friend, but class of 'User'
  #Thus it is circular. Friendship doesn't truly exist independently of User.
  has_many :friendships
  has_many :friends, through: :friendships
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   def stock_already_tracked?(ticker_symbol)
   	# BIG NOTE - Using the console and running things from there, methods can be brought into this.
   	# It's a good trainee method, I think.
   	#Not in stock class, ergo, need to type Stock
   	#First check if the stock exists in the Database
   	stock = Stock.check_db(ticker_symbol)
   	return false unless stock
   	#Is the user tracking this stock?
   	stocks.where(id: stock.id).exists?
   end
  

  def under_stock_limit?
  	#In user model, user is implied
  	#This keeps it to below 10, which is something I misunderstood in branch my-version.
  	stocks.count < 10
  end

  def can_track_stock?(ticker_symbol)
  	#Double verification, ensuring under limit, and not duplicating a stock. 
  	under_stock_limit? && !stock_already_tracked?(ticker_symbol)
  	#Question - I should understand why User makes more sense than stock, which is what I initially did.
  end

  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name
    "Anonymous"
  end

   def check_friend_list(email)
      friends.where(email: email).first
   end


end
