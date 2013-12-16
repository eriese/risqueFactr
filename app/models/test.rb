# == Schema Information
#
# Table name: tests
#
#  id         :integer          not null, primary key
#  date_taken :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Test < ActiveRecord::Base
  attr_accessible :date_taken
  has_many :infections
  has_many :diseases, through: :infections
end
