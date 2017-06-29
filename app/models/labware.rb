# == Schema Information
#
# Table name: labwares
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  quantity    :integer
#  code        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :text
#

class Labware < ActiveRecord::Base
    validates :description, :name, :quantity, :code, presence: true
    
    mount_uploader :image, ImageUploader
    
  # ------------------------------------------------------------------
  # Validations
  # ------------------------------------------------------------------
  validate def check_image_dimensions
    if geometry[:width] < 400 || geometry[:height] < 400
      errors.add :image, 'Please upload images larger than 400 x 400 pixels'
    end
  end
  # ------------------------------------------------------------------
  # Public Instance Methods
  # ------------------------------------------------------------------
  def geometry
    @geometry ||= _geometry
  end
  private
  # ------------------------------------------------------------------
  # Private Instance Methods
  # ------------------------------------------------------------------
  def _geometry
    if image.file and File.exists?(image.file.file)
      img = ::Magick::Image::read(image.file.file).first
      { width: img.columns, height: img.rows }
    end
  end
end
