class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :car_type
      t.string :cars_available
      t.timestamps
    end
  end
end
