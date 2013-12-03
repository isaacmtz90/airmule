class GenerateMessages < ActiveRecord::Migration
  def change
  	create_table :messages do |t|
      t.integer :user_id
      t.string :message
      t.date :date
      t.string :state
      t.timestamps
  	end
  end
end
