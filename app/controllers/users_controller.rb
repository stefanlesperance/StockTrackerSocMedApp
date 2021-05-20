class UsersController < ApplicationController
 
  def show
  	byebug
  	@user = User.where(email: params[:friend])
  end 


  def friends_list
	@friends_list = current_user.friends
  end

  def my_portfolio
  	@tracked_stocks = current_user.stocks
  end

end
