class Guest < ApplicationRecord
  belongs_to :invitation
  has_one :rsvp
end
