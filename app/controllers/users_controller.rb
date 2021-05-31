class UsersController < ApplicationController
 
  def show
    @user = User.where("id LIKE :query", :query => params[:friend_id]).first
    @tracked_stocks = @user.stocks
  end 


  def friends_list
	 @friends_list = current_user.friends
  end

  def my_portfolio
  	@tracked_stocks = current_user.stocks
  end

end
