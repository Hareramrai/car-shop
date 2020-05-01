class CreateModelFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :model_features do |t|
      t.string :manufacturer
      t.string :model
      t.string :series
      t.integer :body_type, index: true
      t.string :cylinders
      t.string :displacement
      t.references :body_color, foreign_key: true

      t.timestamps
    end
  end
end
