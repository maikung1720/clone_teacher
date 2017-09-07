# == Schema Information
#
# Table name: labwares
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  quantity    :integer          default(0)
#  code        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :text
#  circulation :integer          default(0)
#

require 'test_helper'

class LabwareTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
