class CreatePronouns < ActiveRecord::Migration
  def change
    create_table :pronouns do |t|
      t.string :subject
      t.string :object
      t.string :possessive
      t.string :obj_possessive
      t.string :reflexive

      t.timestamps
    end
  end
end
