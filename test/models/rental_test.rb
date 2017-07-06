# == Schema Information
#
# Table name: rentals
#
#  id          :integer          not null, primary key
#  rental_date :datetime
#  due_date    :datetime
#  User_id     :integer
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RentalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
