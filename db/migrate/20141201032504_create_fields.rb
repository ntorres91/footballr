class CreateFields < ActiveRecord::Migration
  belongs_to :borough

  def change
    create_table :fields do |t|
      t.string :content
      t.string :name
      t.string :street
      t.integer :zipcode
      t.references :borough
      t.timestamps
    end
  end
end
