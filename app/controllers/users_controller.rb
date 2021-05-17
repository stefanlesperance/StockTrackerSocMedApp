class UsersController < ApplicationController
  def friends
	@friends_list = current_user.friends
  end

  def my_portfolio
  	@tracked_stocks = current_user.stocks
  end

  def destroy_friend_link
  	byebug
  	friend = Friendship.where(user_id: current_user.id, friend: friend.id).first
  	friend.destroy
  	flash[:notice] = "#{friend.full_name} was successfully removed from portfolio"
	redirect_to users_friends_path
  end


end
