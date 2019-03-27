class CreateExamResults < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_results do |t|
      t.references :student, foreign_key: true
      t.references :subject, foreign_key: true
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
