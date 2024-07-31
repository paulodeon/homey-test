class Project < ApplicationRecord
  include AASM

  has_many :timeline_items, as: :timelineable

  after_create :create_timeline_item

  attr_accessor :current_user

  aasm do
    state :created, initial: true
    state :in_progress
    state :completed

    event :start, after: :create_timeline_item do
      transitions from: :created, to: :in_progress
    end

    event :finish, after: :create_timeline_item do
      transitions from: :in_progress, to: :completed
    end
  end

  private

  def create_timeline_item
    timeline_items.create!(user: current_user, action: "change_status", data: { from: aasm.from_state, to: aasm.to_state || "create" })
  end
end
