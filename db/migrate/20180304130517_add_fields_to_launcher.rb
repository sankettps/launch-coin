class AddFieldsToLauncher < ActiveRecord::Migration[5.1]
  def change
    add_column :launchers, :first_name, :string
    add_column :launchers, :last_name, :string
    add_column :launchers, :mobile_no, :string
  end
end
