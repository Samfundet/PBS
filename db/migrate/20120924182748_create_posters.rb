class CreatePosters < ActiveRecord::Migration
  def up
    create_table :posters do |t|
      t.string :name
      t.text :poster_text
      t.text :description
      t.boolean :flyers
      t.boolean :banner
      t.boolean :archived, :default =>false
      t.boolean :canceled,  :default =>false
      t.datetime :send_to_press
      t.references :dimension
      t.references :member

      t.timestamps
    end
  end

  def down
    drop_table :posters
  end
end
