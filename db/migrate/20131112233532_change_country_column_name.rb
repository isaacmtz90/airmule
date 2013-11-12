class ChangeCountryColumnName < ActiveRecord::Migration
  def change
  	rename_column :trips, :from_countr, :from_country
  end
end
