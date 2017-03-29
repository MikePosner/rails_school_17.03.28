class GeneralStudentsController < ApplicationController

	def new 
		@user=User.new
	end

	def show
		@user = User.new session[:user]
		@teacher=User.where category:2
		@teacher_name=""
		# @teacher.each{|t| @teacher_name << t.teacher_name}
		@teacher.size>=1?@teacher_name=@teacher.map(&:name).join('、'):@teacher_name=@teacher.name
	end

	def edit
		 @user = User.find(session[:user]['id'])
	end

	def update
    	@user = User.find(session[:user]['id'])
		if @user.update(user_params)
			session[:user] = @user
      		redirect_to :general_students_show
    	else
      		render 'edit'
    	end
	end

	private
    	def user_params
      		params.require(:user).permit(:name,:class_name)
    	end
end
