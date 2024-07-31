class Project < ApplicationRecord
  include AASM

  aasm do
    state :created, initial: true
    state :in_progress
    state :completed

    event :start do
      transitions from: :created, to: :in_progress
    end

    event :finish do
      transitions from: :in_progress, to: :completed
    end
  end
end
