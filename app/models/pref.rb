# == Schema Information
#
# Table name: prefs
#
#  id           :integer          not null, primary key
#  genital_name :string(255)
#  anus_name    :string(255)
#  pronoun_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Pref < ActiveRecord::Base
  attr_accessible :genital_name, :anus_name, :pronoun_id
  has_many :users
  has_many :partners
  belongs_to :pronoun
end
