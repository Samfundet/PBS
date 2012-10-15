# -*- encoding : utf-8 -*-
class Poster < ActiveRecord::Base
  attr_accessible :name, :poster_text, :description, :flyers, :banner, :archived, :send_to_press, :dimension_id, :responsible_id, :orderer_id, :canceled
	belongs_to :dimension
  belongs_to :responsible, :class_name => 'Member', :foreign_key => :responsible_id
  belongs_to :orderer, :class_name => 'Member', :foreign_key => :orderer_id

  #@@POSTER_STATUSES = {:active => 'Aktiv', :canceled => 'Avbestilt', :archived => 'Arkivert', nil => 'Ikke satt'}
  #validates_inclusion_of :poster_status, :in => @@POSTER_STATUSES.keys, :message => "Invalid poster status"

end
