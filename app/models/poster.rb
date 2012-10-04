class Poster < ActiveRecord::Base
  attr_accessible :name, :poster_text, :description, :flyers, :banner
	has_one :dimension
end
