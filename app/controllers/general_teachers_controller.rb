class GeneralTeachersController < ApplicationController

	def new 
		@user=User.new
	end

	def show
		# debugger
		@user = User.new session[:user]
		@student=User.where category:3
		@student_name=""
		@student.size>=1?@student_name=@student.map(&:student_name).join('、'):@student_name=@student.student_name
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
      		redirect_to :general_teachers_show
    	else
      		render 'edit'
    	end
	end

	private
    	def user_params
      		params.require(:user).permit(:teacher_name,:class_name)
    	end
end
