# == Schema Information
#
# Table name: partners
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  pref_id     :integer
#  name        :string(255)
#  frequency   :string(255)
#  familiarity :integer
#  exclusivity :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Partner < ActiveRecord::Base
  attr_accessible :user_id, :pref_id, :name, :frequency, :familiarity, :exclusivity
  belongs_to :user
  has_many :encounters
  belongs_to :pref

  validates :user_id, :name, :presence => true

end
