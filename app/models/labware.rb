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
#

class Labware < ActiveRecord::Base
    validates :description, :name, :quantity, :code, presence: true
end
