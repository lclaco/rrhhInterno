class AddAdditionalFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :birthdate, :date
    add_column :users, :relevant, :string
    add_column :users, :data, :string
  end
end
