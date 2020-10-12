class Airplane < ApplicationRecord
  has_many :state_logs
  include AASM
  aasm column: :state do
    state :parked
    state :departed
    state :in_air

    event :depart do
      transitions from: :parked, to: :departed
    end

    event :launch do
      transitions from: :departed, to: :in_air
    end

    after_all_transitions :log_status_change
  end

  def log_status_change
    StateLog.create airplane_id: self.id, state: aasm.to_state
  end

  before_create do
    self.name ||= Faker::Artist.unique.name
  end

  after_create do
    StateLog.create airplane_id: self.id, state: self.state
  end
end
