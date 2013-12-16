# == Schema Information
#
# Table name: diseases
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  gestation_min :integer
#  gestation_max :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Disease < ActiveRecord::Base
  attr_accessible :gestation_max, :gestation_min, :name
  has_many :infections
  has_many :tests, through: :infections
end
