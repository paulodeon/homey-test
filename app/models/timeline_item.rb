class TimelineItem < ApplicationRecord
  belongs_to :user
  belongs_to :timelineable, polymorphic: true

  has_rich_text :comment

  def created?
    action == "change_status" && data["to"] == "create"
  end
end
