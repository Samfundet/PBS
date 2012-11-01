class Asset < ActiveRecord::Base
  attr_accessible :image_content_type, :image_file_name, :image_file_size, :image_updated_at, :image

  belongs_to :poster

  has_attached_file :image,
    :styles => {
        :thumb => '150x150#',
        :medium => '300x300>',
        :large => '600x600>'
    }


end
