class CreateFruits < ActiveRecord::Migration[5.1]
  def change
    create_table :fruits do |t|
      t.string :name
      t.references :seed, foreign_key: true

      t.timestamps
    end
  end
end
