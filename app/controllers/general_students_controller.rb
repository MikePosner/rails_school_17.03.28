class GeneralStudentsController < ApplicationController

	def new 
		@user=User.new
	end

	def show
		@user = User.new session[:user]
		@teacher=User.where category:2
		@teacher_name=""
		# @teacher.each{|t| @teacher_name << t.teacher_name}
		@teacher.size>=1?@teacher_name=@teacher.map(&:teacher_name).join('、'):@teacher_name=@teacher.teacher_name
	end

	def edit
		# debugger
		 @user = User.find(session[:user]['id'])
	end

	def update
		# debugger
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
      		params.require(:user).permit(:student_name,:class_name)
    	end
end
