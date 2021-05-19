class RemoveBloodGroupToStudy < ActiveRecord::Migration[6.1]
  def change
    remove_column :studies, :blood_group, :string, array: true
  end
end
