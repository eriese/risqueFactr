# == Schema Information
#
# Table name: prefs
#
#  id           :integer          not null, primary key
#  genital_name :string(255)
#  anus_name    :string(255)
#  pronoun_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Pref < ActiveRecord::Base
  attr_accessible :genital_name, :anus_name, :pronoun_id, :users_attributes, :partners_attributes
  has_many :users
  has_many :partners
  belongs_to :pronoun
  accepts_nested_attributes_for :users, :partners
end
