class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :starts_at
      t.datetime :ends_at
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude

      t.references :user, index: true

      t.timestamps
    end
  end
end
