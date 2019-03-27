class CreateClubStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :club_students do |t|
      t.references :student
      t.references :club, foreign_key: true

      t.timestamps
    end
  end
end
