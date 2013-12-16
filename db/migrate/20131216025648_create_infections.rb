class CreateInfections < ActiveRecord::Migration
  def change
    create_table :infections do |t|
      t.integer :test_id
      t.integer :disease_id
      t.boolean :positive

      t.timestamps
    end
  end
end
