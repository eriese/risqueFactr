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

require 'spec_helper'

describe Disease do
  pending "add some examples to (or delete) #{__FILE__}"
end
