class AddUserRecivingMessage < ActiveRecord::Migration
  def change
  	add_column :messages, :id_user_to, :string
  end
end
