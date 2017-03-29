class RemoveTeacherNameAndStudentNameFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :teacher_name, :string
  	remove_column :users, :student_name, :string
  	remove_column :users, :class_name, :string
  	add_column :users, :type, :string
  end
end
