class CreateFavouriteIcos < ActiveRecord::Migration[5.1]
  def change
    create_table :favourite_icos do |t|
      t.references :launcher, foreign_key: true
      t.references :coin_ico, foreign_key: true
      t.boolean :is_favourite

      t.timestamps
    end
  end
end
