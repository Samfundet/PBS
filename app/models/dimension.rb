# -*- encoding : utf-8 -*-
class Dimension < ActiveRecord::Base
  attr_accessible :text, :status
  has_many :poster
  validates :text, :presence => true

  @@STATUSES = {true => "Aktiv", false => "Ikke-Aktiv"}
  validates_inclusion_of :status, :in => @@STATUSES.keys

  def to_s
    text
  end


  def status=(value)
    write_attribute(:status, value.to_s)
  end

  def status_string
    @@STATUSES[status]
  end


end
