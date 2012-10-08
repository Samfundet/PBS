class Dimension < ActiveRecord::Base
  attr_accessible :text
  has_many :poster
  def to_s
    text
  end
end
