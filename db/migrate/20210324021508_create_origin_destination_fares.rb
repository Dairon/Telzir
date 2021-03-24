class CreateOriginDestinationFares < ActiveRecord::Migration[6.1]
  def change
    create_table :origin_destination_fares do |t|
      t.string :origin
      t.string :destination
      t.decimal :fare

      t.timestamps
    end
  end
end
