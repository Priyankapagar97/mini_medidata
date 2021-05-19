class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :email_address
      t.string :name
      t.integer :study_id
      t.timestamps
    end
  end
end
