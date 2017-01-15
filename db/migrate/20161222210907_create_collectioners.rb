class CreateCollectioners < ActiveRecord::Migration
  def change
    create_table :collectioners do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :facebook_url
      t.string :twitter_url
      t.string :instagram_url
      t.string :pinterest_url

      t.timestamps null: false
    end
  end
end
