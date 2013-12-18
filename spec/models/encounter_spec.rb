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

require 'spec_helper'

describe Encounter do
  before(:each) do
    @user = User.create({name: "Enoch", email: "eriese", password: "pass", password_confirmation: "pass"})
    @partner = @user.partners.create({name: "Alice", frequency: "every once in a while", familiarity: 6, exclusivity: "exclusive"})
    @encounter = @partner.encounters.create({fluid: false, self_risk: 3})
    @part1 = Instrument.first
    @part2 = Instrument.last
    @contact1 = @encounter.contacts.create({user_instrument: @part1.id, partner_instrument: @part2.id, barriers: true})
  end
  describe "contacts_parts" do
    it "creates an array of the contacts info" do
      parts_array = @encounter.contacts_parts
      expect(parts_array).to match_array([[@part1.part, @part2.part, true]])
    end
  end
  describe "no_barrier" do
    it "creates an array of contacts with no barrier" do
      expect(@encounter.no_barrier).to match_array([])
    end
  end
  describe "with_barrier" do
    it "creates an array of contacts with a barrier" do
      expect(@encounter.with_barrier).to match_array([@contact1])
    end
  end
  describe "risk" do

    it "spits out a number" do
      expect(@encounter.risk).to eq(1)
    end
  end
end
