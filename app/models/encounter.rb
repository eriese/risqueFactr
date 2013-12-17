# == Schema Information
#
# Table name: encounters
#
#  id         :integer          not null, primary key
#  partner_id :integer
#  fluid      :boolean
#  notes      :text
#  self_risk  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  took_place :date
#

class Encounter < ActiveRecord::Base
  attr_accessible :partner_id, :fluid, :took_place, :notes, :self_risk, :contacts_attributes
  belongs_to :partner
  has_many :contacts
  validates :partner_id, :presence => true
  accepts_nested_attributes_for :contacts, reject_if: lambda {|contact| contact[:partner_instrument].blank?}

  def contacts_parts
    parts = self.contacts.map do |contact|
      contact_array = []
      contact_array << Instrument.find(contact.user_instrument).part
      contact_array << Instrument.find(contact.partner_instrument).part
      contact_array << contact.barriers
      contact_array
    end
  end
  def no_barrier
    self.contacts.where(barriers: false)
  end
  def with_barrier
    self.contacts.where(barriers: true)
  end
  def risk
    @risk = 0
    @risk += self.no_barrier.length
    @risk += self.with_barrier.length / 2
    @risk *= 5 if self.fluid
    @risk *= partner.risk
    @risk /= 10
    @risk += self.self_risk
    @risk /= 2
    return @risk
  end
end
