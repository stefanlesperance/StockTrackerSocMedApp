class FriendshipController < ApplicationController

	def search
		#First make sure param is present
		if params[:friend].present?
			#Search for the user
			query = params[:friend]
			@user = User.where("email LIKE :query OR first_name LIKE :query", :query => query).first
			if !@user.nil?
				#Now I need to somehow ADD them to the friends list. Dirty way of doing it.
				respond_to do |format|
					format.js {render partial: 'users/friendresult'}
				end
			else
				respond_to do |format|
					flash.now[:alert] = "User #{params[:friend]} does not exist"
					format.js {render partial: 'users/friendresult'}
				end
			end
		end
	end

	def create

	end

	def destroy
	  	friend = Friendship.where(user_id: current_user.id, friend: friend.id).first
	  	friend.destroy
	  	flash[:notice] = "#{friend.full_name} was successfully removed from portfolio"
		redirect_to users_friends_path
	end


end