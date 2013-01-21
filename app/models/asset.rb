class Asset < ActiveRecord::Base
  attr_accessible :image_content_type, :image_file_name, :image_file_size, :image_updated_at, :image

  belongs_to :poster

  has_attached_file :image,
    :styles => {
        :thumb => '150x150#'
    }
  validates_format_of :image_file_name, :with => /\.(bmp|jpg|jpeg|png|gif|ai|eps|svg|pdf|doc|docx|rtf|odt|txt)\Z/

  validate :too_large_file
  def too_large_file
    if image_file_size > 1000000
      errors.add(:image_file_size, "The file is too large.")
    end
  end
end
