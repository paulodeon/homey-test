class User < ApplicationRecord
  has_many :timeline_items
end
