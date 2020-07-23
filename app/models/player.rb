# == Schema Information
#
# Table name: players
#
#  id         :bigint           not null, primary key
#  uuid       :string(255)
#  username   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Player < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  before_create :set_uuid

  has_and_belongs_to_many :games

  private

    def set_uuid
      self.uuid = SecureRandom.uuid
    end
end
