class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.integer :downloads, default: 0
      t.text :description, null: false

      t.timestamps
    end
  end
end
