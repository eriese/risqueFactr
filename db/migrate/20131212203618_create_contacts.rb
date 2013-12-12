class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :encounter_id
      t.integer :user_instrument
      t.integer :partner_instrument

      t.timestamps
    end
  end
end
