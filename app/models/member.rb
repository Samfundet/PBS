class Member < ActiveRecord::Base
  self.primary_key = :medlem_id
  attr_accessible :fornavn, :etternavn, :mail, :telefon, :passord
  has_many :poster
end
