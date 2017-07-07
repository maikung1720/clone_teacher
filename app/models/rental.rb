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

class Rental < ActiveRecord::Base
  belongs_to :User
  
  has_many :rental_details, dependent: :destroy
  has_many :labware, through: :rental_details
  
  accepts_nested_attributes_for :rental_details, allow_destroy: true
  
  enum status: {application: 'application', approval: 'approval', reject: 'reject', lending: 'lending', returned: 'returned'}

end
