class CreateAccount < ActiveRecord::Migration
  def self.up
    create_table :account do |t|
      t.string :name,     :null => false, :default => ''
      t.string :password, :null => false, :default => ''

      t.timestamps
    end
  end

  def self.down
    drop_table :account
  end
end
