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

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_create :ensure_uuid
  validates :given_name, presence: true
  validates :family_name, presence: true
  validates :email, presence: true

  private
    def ensure_uuid
      self.uuid ||= SecureRandom.uuid
    end
end
