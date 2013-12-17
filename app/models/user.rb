# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  pref_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :pref_attributes
  has_many :encounters, through: :partners
  has_many :partners
  has_many :sti_tests
  belongs_to :pref
  has_secure_password
  validates :name, :email, :password, :password_confirmation, :presence => true
  validates :email, :uniqueness => true
  accepts_nested_attributes_for :pref

  def pronoun
    if self.pref_id
      return self.pref.pronoun
    else
      return nil
    end
  end
end
