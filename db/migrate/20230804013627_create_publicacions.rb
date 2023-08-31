class CreatePublicacions < ActiveRecord::Migration[7.0]
  def change
    create_table :publicacions do |t|
      t.string :title
      t.text :description
      t.integer :salary  
      t.timestamps
    end
  end
end
