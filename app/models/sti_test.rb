# == Schema Information
#
# Table name: tests
#
#  id         :integer          not null, primary key
#  date_taken :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StiTest < ActiveRecord::Base
  attr_accessible :date_taken, :infections_attributes
  has_many :infections
  has_many :diseases, through: :infections
  accepts_nested_attributes_for :infections, reject_if: lambda {|infection| infection[:positive].blank?}, :allow_destroy => true
end
