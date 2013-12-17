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

class Partner < ActiveRecord::Base
  attr_accessible :user_id, :pref_id, :name, :frequency, :familiarity, :exclusivity, :pref_attributes
  belongs_to :user
  has_many :encounters
  belongs_to :pref
  accepts_nested_attributes_for :pref
  validates :user_id, :name, :presence => true
  def most_recent
    self.encounters_by_date.first
  end
  def encounters_by_date
    self.encounters.order("took_place DESC")
  end
  def risk
    @risk = 0
    case self.exclusivity
    when "exclusive"
      @risk += 1
    when "only having sex with known others"
      @risk += 2
    when "not exclusive with disclosure of other partners"
      @risk += 3
    when "not exclusive, no disclosure of other partners"
      @risk += 4
    end
    @risk += 10 - self.familiarity
    return @risk
  end
  def pronoun
    if self.pref_id
      return self.pref.pronoun
    else
      return nil
    end
  end
  def at_risk(disease)
    if self.most_recent
      if disease.risk_window(self.user)
        return disease.risk_window(self.user) < self.most_recent.took_place
      else
        return true
      end
    else
      return false
    end
  end
end
