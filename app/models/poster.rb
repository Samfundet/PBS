# -*- encoding : utf-8 -*-
class Poster < ActiveRecord::Base
  attr_accessible :name, :poster_text, :description, :specification, :flyers, :banner, :send_to_press, :dimension_id, :responsible_id, :orderer_id, :status
	belongs_to :dimension
  belongs_to :responsible, :class_name => 'Member', :foreign_key => :responsible_id
  belongs_to :orderer, :class_name => 'Member', :foreign_key => :orderer_id

  @@STATUSES = {:active => 'Aktiv', :canceled => 'Avbestilt', :archived => 'Arkivert', nil => 'Ikke satt'}
  validates_inclusion_of :status, :in => @@STATUSES.keys, :message => "Invalid poster status"

  def status
    field = read_attribute(:status)
    field = nil if not field.nil? and field.empty?
    return field.to_sym unless field.blank?
  end

  def status=(value)
    write_attribute(:status, value.to_s)
  end

  def status_string
    @@STATUSES[status]
  end

end
