class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.integer :user_id
      t.integer :pref_id
      t.string :name
      t.string :frequency
      t.integer :familiarity
      t.string :exclusivity

      t.timestamps
    end
  end
end
