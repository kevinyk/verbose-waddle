class SessionsController < ApplicationController
	def create
		u = User.find_by(email: params[:user][:email])
		puts "found user, #{u}"
		if u.authenticate(params[:user][:password])
			session[:user_id] = u.id
			redirect_to '/users'
		else
			flash[:errors] = ["Invalid login"]
			redirect_to :back
		end
	end
	def destroy
		reset_session
		redirect_to '/'
	end
end
