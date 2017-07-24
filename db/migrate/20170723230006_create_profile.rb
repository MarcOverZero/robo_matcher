class CreateProfile < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :photo
      t.string :location
      t.string :interest
      t.string :gender
      t.integer :age
      t.string :bodytype

      t.timestamps
    end
  end
end
