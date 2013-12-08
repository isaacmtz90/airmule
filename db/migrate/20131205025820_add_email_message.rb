class AddEmailMessage < ActiveRecord::Migration
  def change
  	add_column :messages, :email_sending, :string
  end
end
