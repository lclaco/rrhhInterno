class AddApplicantToApplications < ActiveRecord::Migration[7.0]
  def change
    add_reference :applications, :applicant, foreign_key: { to_table: :users }
  end
end
