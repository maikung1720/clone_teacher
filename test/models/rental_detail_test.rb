# == Schema Information
#
# Table name: rental_details
#
#  id         :integer          not null, primary key
#  rental_id  :integer
#  labware_id :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RentalDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
