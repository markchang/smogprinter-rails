class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :api_key
      t.string :uid
      t.string :name
      t.string :nickname
      t.string :token
      t.string :secret

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
