class AddOmniauthToLaunchers < ActiveRecord::Migration[5.1]
  def change
    add_column :launchers, :provider, :string
    add_column :launchers, :uid, :string
  end
end
