# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  pref_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :encounters, through: :partners
  has_many :partners
  has_many :tests
  belongs_to :pref

  has_secure_password
  validates :name, :email, :password, :password_confirmation, :presence => true
  validates :email, :uniqueness => true
end
