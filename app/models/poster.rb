# -*- encoding : utf-8 -*-
class Poster < ActiveRecord::Base
  attr_accessible :name, :poster_text, :description, :flyers, :banner, :send_to_press, :event_time, :dimension_id, :responsible_id, :orderer_id, :status, :group_id, :event_id, :area_id, :assets, :assets_attributes
	belongs_to :dimension
  belongs_to :group
  belongs_to :area
  belongs_to :responsible, :class_name => 'Member', :foreign_key => :responsible_id
  belongs_to :orderer, :class_name => 'Member', :foreign_key => :orderer_id
  belongs_to :event
  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true

  validates :name, :group_id, :dimension_id, :presence => true
 
  validates :event_time, :presence => true
  validates :event_time, :date => {:after => DateTime.now + 3.week, :message => "Du rakk ikke fristen som er på 3 uker, send mail til layout@samfundet.no eller noe slikt",
  :if => Proc.new do
    if !(Authorization.current_user.respond_to? :role_symbols) or !(Authorization.current_user.role_symbols.include? :lim_web)
      true
    end
  end
     }
  validates_associated :group, :dimension


  @@STATUSES = {:active => 'Aktiv', :canceled => 'Avbestilt', :archived => 'Arkivert', nil => 'Ikke satt'}
  validates_inclusion_of :status, :in => @@STATUSES.keys, :message => "Invalid poster status"

  scope :active, where('status = "active"')
  


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
