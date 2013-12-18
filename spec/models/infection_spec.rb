# == Schema Information
#
# Table name: infections
#
#  id         :integer          not null, primary key
#  test_id    :integer
#  disease_id :integer
#  positive   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
