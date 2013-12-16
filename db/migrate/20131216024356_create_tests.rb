class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.date :date_taken
      t.integer :user_id
      t.timestamps
    end
  end
end
