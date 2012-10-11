# -*- encoding : utf-8 -*-
class Poster < ActiveRecord::Base
  attr_accessible :name, :poster_text, :description, :flyers, :banner, :archived, :send_to_press, :dimension_id, :member_id, :canceled
	belongs_to :dimension
  belongs_to :member
end
