class AddYearsOldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :yearsOld, :integer
  end
end
