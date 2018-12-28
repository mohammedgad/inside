class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :students, :coaches do |t|
      t.index [:student_id, :coach_id]
      t.index [:coach_id, :student_id]
    end
  end
end
