class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :refresh_token
      t.string :access_token

      t.timestamps
    end
  end
end
