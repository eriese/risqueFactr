# == Schema Information
#
# Table name: instruments
#
#  id         :integer          not null, primary key
#  part       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Instrument < ActiveRecord::Base
  attr_accessible :part
  has_many :contacts, foreign_key: "partner_instrument"
  has_many :contacts, foreign_key: "user_instrument"
end
