class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
