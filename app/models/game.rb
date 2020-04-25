require 'securerandom'

class Game < ApplicationRecord
  validates :name, presence: true

  before_create :set_uuid

  # Use the :uuid attribute for routing
  def to_param
    uuid
  end

  private

  # Set v4 UUID before creating
  # This UUID is used for the resourceful path to the game to prevent users
  # randomly finding games they have not been invited to.
  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
