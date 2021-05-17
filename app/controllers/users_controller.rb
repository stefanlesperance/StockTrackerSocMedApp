class UsersController < ApplicationController
  def friends
  	@user = current_user
	@friends_list = current_user.friends
  end

  def my_portfolio
  	@tracked_stocks = current_user.stocks
  end


end
