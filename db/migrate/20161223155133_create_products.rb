class CreateProducts < ActiveRecord::Migration
  def change
    # use decimal for currencies better
    create_table :products do |t|
      t.references :collection, index: true, foreign_key: true
      t.boolean :is_live
      t.string :title
      t.string :description
      t.float :price
      t.string :picture
      t.string :shop_url

      t.timestamps null: false
    end
  end
end
