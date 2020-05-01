class CreateModelFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :model_features do |t|
      t.string :manufacturer
      t.string :model
      t.string :series
      t.integer :body_type, index: true
      t.integer :cylinders
      t.integer :displacement
      t.references :body_color, foreign_key: true

      t.timestamps
    end
  end
end
