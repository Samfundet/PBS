class Event < ActiveRecord::Base
  attr_accessible :name, :time

  def to_s
    name
  end
end
