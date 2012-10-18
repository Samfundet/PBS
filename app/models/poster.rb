# -*- encoding : utf-8 -*-
class Poster < ActiveRecord::Base
  attr_accessible :name, :poster_text, :description, :specification, :flyers, :banner, :send_to_press, :event_time, :dimension_id, :responsible_id, :orderer_id, :status, :group_id
	belongs_to :dimension
  belongs_to :group
  belongs_to :responsible, :class_name => 'Member', :foreign_key => :responsible_id
  belongs_to :orderer, :class_name => 'Member', :foreign_key => :orderer_id

  @@STATUSES = {:active => 'Aktiv', :canceled => 'Avbestilt', :archived => 'Arkivert', :ready => 'Klar til henting', nil => 'Ikke satt'}
  validates_inclusion_of :status, :in => @@STATUSES.keys, :message => "Invalid poster status"
  validate :is_valid_date?

  scope :active, where('status = "active" OR status = "ready"')

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

  private
  def is_valid_date?
    if !((event_time.to_i - 21*60*60*24) > DateTime.now.to_i)
      errors.add(:event_time, "Du rakk ikke fristen som er på 3 uker, send mail til layout@samfundet.no eller noe slikt")
    end
  end

end
