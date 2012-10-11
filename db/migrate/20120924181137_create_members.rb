# -*- encoding : utf-8 -*-
class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members, :primary_key => :medlem_id do |t|
      t.string :firstname
      t.string :surname
      t.string :email
      t.string :phone
      t.string :password
    end
  end

  def self.down
    drop_table :members
  end
end
