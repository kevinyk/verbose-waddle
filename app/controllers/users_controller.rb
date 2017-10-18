class UsersController < ApplicationController
	before_action :require_current_user, only: [:index]
	before_action :authorize_user, only: [:destroy]
	def new
	end
	def create
		u = User.new(user_params)
		if u.valid?
			u.save
			session[:user_id] = u.id
			redirect_to '/users'
		else
			flash[:errors] = u.errors.full_messages
			redirect_to :back
		end
	end
	def index
		@users = User.all
	end
	def destroy
		User.find(params[:id]).destroy
		redirect_to '/users'
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
