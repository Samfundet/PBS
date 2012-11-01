# -*- encoding : utf-8 -*-
class CreateDimensions < ActiveRecord::Migration
  def up
    create_table :dimensions do |d|
      d.string :text
      d.boolean :status
    end
  end

  def down
    drop_table :dimensions
  end
end

