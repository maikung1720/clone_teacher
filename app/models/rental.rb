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
#  rack_no     :integer
#

class Rental < ActiveRecord::Base
  belongs_to :User
  before_create :set_rental_status
  
  has_many :rental_details, dependent: :destroy
  has_many :labware, through: :rental_details
  
  accepts_nested_attributes_for :rental_details, allow_destroy: true
  
  enum status: {application: 'application', approval: 'approval', reject: 'reject', lending: '', returned: 'returned', progress: 'progress'}
  enum rack_no: {Rack1: 1, Rack2: 2, Rack3: 3}
  
private
  def set_rental_status
    self.status = "progress"
  end

end
