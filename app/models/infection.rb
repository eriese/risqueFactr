# == Schema Information
#
# Table name: infections
#
#  id         :integer          not null, primary key
#  test_id    :integer
#  disease_id :integer
#  positive   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Infection < ActiveRecord::Base
  attr_accessible :disease_id, :positive, :test_id
  belongs_to :disease
  belongs_to :test
end
