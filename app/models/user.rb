# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string
#  name                   :string
#  image                  :text
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  enum role: {admin: 'admin', teacher: 'teacher', student: 'student'}
  
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
