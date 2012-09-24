class CreateDimentions < ActiveRecord::Migration
  def up
    create_table :dimentions do |d|
      d.string :text
    end
  end

  def down
    drop_table :dimentions
  end
end

