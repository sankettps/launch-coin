class CreateCoinIcos < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore'
    create_table :coin_icos do |t|
      t.references :launcher, foreign_key: true
      t.text :description
      t.string :coin_name
      t.float :rate
      t.integer :total_supply
      t.string :website
      t.string :presentation_link
      t.string :facebook_link
      t.string :twitter_link
      t.string :telegram_link
      t.string :coin_logo
      t.string :cover_photo
      t.string :white_paper
      t.string :country
      t.string :accepts
      t.string :token_symbol
      t.hstore :rounds
      t.datetime :ico_end_date

      t.timestamps
    end
  end
end
