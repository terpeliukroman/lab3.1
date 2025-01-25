class CreateGymShops < ActiveRecord::Migration[7.2]
  def change
    create_table :gym_shops do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
