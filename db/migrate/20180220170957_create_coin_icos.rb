class CreateCoinIcos < ActiveRecord::Migration[5.1]
  def change
    create_table :coin_icos do |t|
      t.references :launcher, foreign_key: true
      t.text :description
      t.string :coin_name
      t.string :presentation_link
      t.datetime :ico_end_date

      t.timestamps
    end
  end
end
