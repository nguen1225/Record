class Admins::UsersController < ApplicationController
	def index
		@events = User.all
	end
end
