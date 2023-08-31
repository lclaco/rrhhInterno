class AddCreatedByToJobOffers < ActiveRecord::Migration[7.0]
  def change
    add_reference :job_offers, :created_by, foreign_key: { to_table: :users }
  end
end
