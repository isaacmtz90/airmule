class UserController < ApplicationController
	def show
		@profile_user = User.find(params[:user_id])
	end
end
