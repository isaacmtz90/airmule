class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :username
      t.string :password
      t.string :address
      t.string :city
      t.string :country
      t.string :phone
      t.string :email
      t.string :total_rating
      t.string :total_votes

      t.timestamps
    end
  end
end
