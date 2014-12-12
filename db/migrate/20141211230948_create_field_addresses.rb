class CreateFieldAddresses < ActiveRecord::Migration
  def change
    create_table :field_addresses do |t|
      t.string :name
      t.string :borough
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
