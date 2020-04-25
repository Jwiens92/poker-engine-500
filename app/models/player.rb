class Player < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  before_create :set_uuid

  has_and_belongs_to_many :games

  private

    def set_uuid
      self.uuid = SecureRandom.uuid
    end
end
