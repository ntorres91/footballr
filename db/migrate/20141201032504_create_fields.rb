class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :content
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
