# -*- encoding : utf-8 -*-
class CreatePosters < ActiveRecord::Migration
  def up
    create_table :posters do |t|
      t.string :name
      t.text :poster_text
      t.text :description
      t.text :specification
      t.boolean :flyers
      t.boolean :banner
      t.string :status, :limit => 20
      t.datetime :send_to_press
      t.datetime :event_time
      t.references :dimension
      t.references :group
      t.references :event
      t.references :area
      t.integer :responsible_id
      t.integer :orderer_id

      t.timestamps
    end
  end

  def down
    drop_table :posters
  end
end
