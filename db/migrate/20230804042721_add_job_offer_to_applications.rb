class AddJobOfferToApplications < ActiveRecord::Migration[7.0]
  def change
    add_reference :applications, :job_offer, foreign_key: true
  end
end
