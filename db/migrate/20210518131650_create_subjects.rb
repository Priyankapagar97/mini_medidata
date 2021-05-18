class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :age
      t.string :blood_group, default: ""
      t.timestamps
    end
  end
end
