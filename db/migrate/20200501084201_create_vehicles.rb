class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :vin
      t.float :grade
      t.integer :stock
      t.decimal :price, precision: 10, scale: 2, index: true
      t.integer :year,  index: true
      t.integer :mileage,  index: true
      t.references :model_feature, foreign_key: true

      t.timestamps
    end
  end
end
