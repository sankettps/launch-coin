class AddIsApproveFieldToCoinIco < ActiveRecord::Migration[5.1]
  def change
    add_column :coin_icos, :is_approved, :boolean
  end
end
