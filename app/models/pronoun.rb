# == Schema Information
#
# Table name: pronouns
#
#  id             :integer          not null, primary key
#  subject        :string(255)
#  object         :string(255)
#  possessive     :string(255)
#  obj_possessive :string(255)
#  reflexive      :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Pronoun < ActiveRecord::Base
  attr_accessible :subject, :object, :possessive, :obj_possessive, :reflexive
  has_many :prefs
  validates :possessive, :presence => true
end
