# -*- encoding : utf-8 -*-

class Member < ActiveRecord::Base
  self.primary_key = :medlem_id
  attr_accessible :firstname, :surname, :phone, :email, :password
  has_many :poster
end
