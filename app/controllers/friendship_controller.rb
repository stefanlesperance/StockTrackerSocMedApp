class FriendshipController < ApplicationController

	def create
	end

	def destroy
	  	friend = Friendship.where(user_id: current_user.id, friend: friend.id).first
	  	friend.destroy
	  	flash[:notice] = "#{friend.full_name} was successfully removed from portfolio"
		redirect_to users_friends_path
	end


end