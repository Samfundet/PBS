class Asset < ActiveRecord::Base
  attr_accessible :image_content_type, :image_file_name, :image_file_size, :image_updated_at, :image

  belongs_to :poster

  has_attached_file :image,
    :styles => {
        :thumb => '150x150#'
    }
  validates_format_of :image_file_name, :with => /\.(?i)(bmp|jpg|jpeg|png|gif|ai|eps|svg|pdf)\Z/, :message => "Du forsokta a laste opp en fil ulovlig type."

  validate :too_large_file, :message => "Du forsoke a laste opp en for stor fil."
  def too_large_file
    if image_file_size > 50000000
      errors.add(:image_file_size, "The file is too large.")
    end
  end
end
