# == Schema Information
#
# Table name: games
#
#  id         :bigint           not null, primary key
#  name       :string(255)      default(""), not null
#  uuid       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'securerandom'

class Game < ApplicationRecord
  validates :name, presence: true

  before_create :set_uuid

  has_and_belongs_to_many :players

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
