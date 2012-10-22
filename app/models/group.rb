# -*- encoding : utf-8 -*-
class Group < ActiveRecord::Base
  attr_accessible :name, :poster_id, :medlem_id
  has_many :posters
  has_and_belongs_to_many :members, :association_foreign_key => :medlem_id

  def to_s
    name
  end
end
