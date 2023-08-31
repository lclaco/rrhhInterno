class CreateJobOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :job_offers do |t|
      t.string :title
      t.string :description
      t.integer :salary

      t.timestamps
    end
  end
end
