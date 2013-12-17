class ChangeTestsName < ActiveRecord::Migration
  def change
    rename_table(:tests, :sti_tests)
    rename_column :infections, :test_id, :sti_test_id
  end
end
