class AddPriceSponsorToTournaments < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :priceSponsor, :decimal, precision: 6, scale: 2
    add_column :tournaments, :currency, :string
  end
end
