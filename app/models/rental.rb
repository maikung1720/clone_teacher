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
  
  enum status: {application: 'application', approval: 'approval', reject: 'reject', lending: 'lending', returned: 'returned'}

end
