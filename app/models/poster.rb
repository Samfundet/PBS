class Poster < ActiveRecord::Base
  attr_accessible :name, :poster_text, :description, :flyers, :banner, :archived, :send_to_press
	has_one :dimension
end
