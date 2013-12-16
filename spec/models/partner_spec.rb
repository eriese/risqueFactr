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

require 'spec_helper'

describe Partner do
  pending "add some examples to (or delete) #{__FILE__}"
end
