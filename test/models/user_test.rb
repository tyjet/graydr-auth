# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  given_name  :string
#  family_name :string
#  email       :string
#  uuid        :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
