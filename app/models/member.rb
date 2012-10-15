# -*- encoding : utf-8 -*-

class Member < ActiveRecord::Base
  self.primary_key = :medlem_id
  attr_accessible :firstname, :surname, :phone, :email, :password
  has_many :poster

  has_many :responsible_posters, :class_name => "Poster", :foreign_key => :responsible_id
  has_many :ordered_posters, :class_name => "Poster", :foreign_key => :orderer_id

  def to_s
    firstname
  end
end
