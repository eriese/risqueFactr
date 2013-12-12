class CreatePrefs < ActiveRecord::Migration
  def change
    create_table :prefs do |t|
      t.string :genital_name
      t.string :anus_name
      t.integer :pronoun_id

      t.timestamps
    end
  end
end
