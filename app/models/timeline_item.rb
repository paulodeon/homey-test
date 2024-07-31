class TimelineItem < ApplicationRecord
  belongs_to :user
  belongs_to :timelineable, polymorphic: true

  has_rich_text :comment
end
