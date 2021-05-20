class FriendshipController < ApplicationController

	def search
		#First make sure param is present
		if params[:friend].present?
			#Search for the user
			query = params[:friend]
			@user = User.where("email LIKE :query OR first_name LIKE :query OR last_name LIKE :query 
				OR first_name || ' ' ||last_name LIKE :query", :query => query).first
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
		#Now, I don't need to check if the dude exists, because it's something we've already done. We simply add the user.
		# At it's simplest, I just need to shovel the user in and flash everything. 
		#Actually, I need to find the user based on the e-mail = No I don't I just need to pass the WHOLE user and simply shovel things in.
		#This should grab the param and let me track down the user, in which case I can create the connection.
		# I need to create a check to see if the friend already exists


		@friend = Friendship.create(user_id: params[:user], friend_id: params[:friend])
		if !@friend.blank?
			flash[:notice] = "Friend was successfully added to your friends list."
			redirect_to users_friends_path
		else
			flash[:notice] = "Unable to add friend"
			redirect_to users_friends_path
		end
	end

	def destroy
	  	friend = Friendship.where(user_id: current_user.id, friend_id: params[:id] ).first
	  	if !friend.blank?
		  	friend.destroy
		  	flash[:notice] = "Friend was successfully removed from portfolio"
			redirect_to users_friends_path
		end
	end


end