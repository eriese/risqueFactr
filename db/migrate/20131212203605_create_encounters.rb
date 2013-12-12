class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.integer :partner_id
      t.boolean :fluid
      t.date :date
      t.text :notes
      t.integer :self_risk

      t.timestamps
    end
  end
end
