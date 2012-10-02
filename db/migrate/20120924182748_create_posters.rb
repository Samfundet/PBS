class CreatePosters < ActiveRecord::Migration
  def up
    create_table :posters do |t|
      t.string :name
      t.text :poster_text
      t.text :description
      t.boolean :flyers
      t.boolean :banner
      t.datetime :send_to_press
      t.references :dimension
      #t.has_one :event, :class_name => "Event"
      #t.has_one :orderer, :class_name => "User"
      #t.has_one :responsible, :class_name => "User"

      t.timestamps
    end
  end

  def down
    drop_table :posters
  end
end
