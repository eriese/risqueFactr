class AddBarriersToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :barriers, :boolean
  end
end
