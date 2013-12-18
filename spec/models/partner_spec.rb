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
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Partner do
  before(:each) do
    @user = User.create({name: "Enoch", email: "eriese", password: "pass", password_confirmation: "pass"})
    @partner = @user.partners.create({name: "Alice", frequency: "every once in a while", familiarity: 6, exclusivity: "exclusive"})
  end
  describe "pronoun" do
    context "partner has no prefernces set" do
      it "returns nil" do
        expect(@partner.pronoun).to be_nil
      end
    end
    context "partner has prefernces" do
      it "returns the pronoun" do
        @partner.build_pref({anus_name: "ass", genital_name: "cock", pronoun_id: Pronoun.first.id})
        @partner.save
        expect(@partner.pronoun).to eq(Pronoun.first)
      end
    end
  end
  describe "at_risk" do
    it "returns false if partner has no encounters" do
      expect(@partner.at_risk(Disease.first)).to be_false
    end
    context "partner has encounters" do
      before(:each) do
        @encounter = @partner.encounters.create({fluid: false, self_risk: 3, took_place: "2013-12-18"})
        @part1 = Instrument.first
        @part2 = Instrument.last
        @contact1 = @encounter.contacts.create({user_instrument: @part1.id, partner_instrument: @part2.id, barriers: true})
      end
      it "returns true is the user has not been tested" do
        expect(@partner.at_risk(Disease.first)).to be_true
      end
      it "compares the risk window with the last encounter" do
        @test = @user.sti_tests.create(date_taken: "2013-12-17")
        @test.infections.create({disease_id: Disease.first.id, positive: false})
        expect(Disease.first.risk_window(@user)).to_not be_nil
        expect(@partner.at_risk(Disease.first)).to be_true
      end
    end
  end
end
