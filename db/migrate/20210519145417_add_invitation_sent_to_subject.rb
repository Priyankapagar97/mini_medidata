class AddInvitationSentToSubject < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :invitation_sent, :boolean, default: true
  end
end
