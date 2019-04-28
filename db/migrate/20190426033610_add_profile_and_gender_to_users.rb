class AddProfileAndGenderToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :text
    add_column :users, :gender, :integer
  end
end
