class CreateSession < ActiveRecord::Migration
  def self.up
    create_table :session do |t|
      t.text :session_data
    end

    change_column :session, :id, :string
  end

  def self.down
    drop_table :session
  end
end
