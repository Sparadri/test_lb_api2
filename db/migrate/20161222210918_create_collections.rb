class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.references :collectioner, index: true, foreign_key: true

      t.boolean :is_live
      t.string :title

      t.string :color_dark
      t.string :color_light

      t.string :main_cover_picture
      t.string :interview_cover_picture
      t.string :profile_picture

      t.timestamps null: false
    end
  end
end
