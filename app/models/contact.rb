# == Schema Information
#
# Table name: contacts
#
#  id                 :integer          not null, primary key
#  encounter_id       :integer
#  user_instrument    :integer
#  partner_instrument :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  barriers           :boolean
#

class Contact < ActiveRecord::Base
  attr_accessible :encounter_id, :user_instrument, :partner_instrument, :barriers
  belongs_to :instrument, foreign_key: "user_instrument"
  belongs_to :instrument, foreign_key: "partner_instrument"
  validates :user_instrument, :partner_instrument, :presence => true
end
