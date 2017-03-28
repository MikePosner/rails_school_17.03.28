class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :user_id
      t.string :class_name
      t.string :teacher_name
      t.string :student_name
      t.integer :category
      t.timestamps
    end
  end
end
