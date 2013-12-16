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
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Pronoun do
  pending "add some examples to (or delete) #{__FILE__}"
end
