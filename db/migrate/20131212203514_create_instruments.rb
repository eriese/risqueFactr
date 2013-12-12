class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :part

      t.timestamps
    end
  end
end
