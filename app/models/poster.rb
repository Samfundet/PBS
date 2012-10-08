class Poster < ActiveRecord::Base
  attr_accessible :name, :poster_text, :description, :flyers, :banner, :archived, :send_to_press, :dimension_id, :member_id
	belongs_to :dimension
  belongs_to :member
end
