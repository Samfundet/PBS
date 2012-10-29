class Attachment
  attr_accessible :file
  has_many :file, :dependent => :destroy
  accepts_nested_attributes_for :file, allow destroy => true
end
