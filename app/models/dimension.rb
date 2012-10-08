class Dimension < ActiveRecord::Base
  has_many :poster
  def to_s
    text
  end
end
