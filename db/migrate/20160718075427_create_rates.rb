class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.string :rate, null: false
      t.string :short_description
      t.text :description

      t.timestamps
    end
  end
end
