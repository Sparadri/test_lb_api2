class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|

      t.references :collection, index: true, foreign_key: true

      t.string :question
      t.string :answer
      t.integer :placement
      t.string :picture

      t.timestamps null: false
    end
  end
end
