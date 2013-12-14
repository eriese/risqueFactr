class ChangeDateColumnName < ActiveRecord::Migration
  def up
    remove_column :encounters, :date
    add_column :encounters, :took_place, :date
  end

  def down
    remove_column :took_place, :when
    add_column :encounters, :date, :date
  end
end
