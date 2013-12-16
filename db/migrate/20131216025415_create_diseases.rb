class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
      t.string :name
      t.integer :gestation_min
      t.integer :gestation_max

      t.timestamps
    end
  end
end
