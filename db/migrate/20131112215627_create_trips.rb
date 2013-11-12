class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :from_city
      t.string :from_countr
      t.string :to_city
      t.string :to_country
      t.date :to_when
      t.date :from_when

      t.timestamps
    end
  end
end
