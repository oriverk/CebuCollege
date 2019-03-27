class AddNameToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :name, :string
    add_column :students, :gender, :integer
    add_column :students, :age, :integer
    add_column :students, :opinion, :text
  end
end
