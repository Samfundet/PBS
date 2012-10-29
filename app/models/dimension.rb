# -*- encoding : utf-8 -*-
class Dimension < ActiveRecord::Base
  attr_accessible :text
  has_many :poster
  validates :text, :presence => true

  def to_s
    text
  end
end
