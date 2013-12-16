# == Schema Information
#
# Table name: contacts
#
#  id                 :integer          not null, primary key
#  encounter_id       :integer
#  user_instrument    :integer
#  partner_instrument :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  barriers           :boolean
#

require 'spec_helper'

describe Contact do
  pending "add some examples to (or delete) #{__FILE__}"
end
