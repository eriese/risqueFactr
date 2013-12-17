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
  has_many :sti_tests, through: :infections

  def window(user)
    cases = Infection.where("disease_id = ? AND positive = false AND sti_test_id IN (?)", self.id, StiTest.where(user_id: user)).sort_by do |infection|
      infection.sti_test.date_taken
    end
    if cases.any?
    for_time = cases.last.sti_test.date_taken.to_s.split("-")
    t = Time.mktime(for_time[0], for_time[1], for_time[2])
    window = t - self.gestation_max * (60 * 60 * 24 * 7)
    window
  end
  end
end
