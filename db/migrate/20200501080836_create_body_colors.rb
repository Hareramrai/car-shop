class CreateBodyColors < ActiveRecord::Migration[5.2]
  def change
    create_table :body_colors do |t|
      t.string :interior
      t.string :exterior

      t.timestamps
    end
  end
end
