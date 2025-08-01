class Ticket < ApplicationRecord
  validates :attendee_email, presence: true
  belongs_to :event
  validate :not_over_capacity

  def not_over_capacity
    if event.tickets.count >= event.venue_capacity
      errors.add(:base, "Venue capacity reached!")
    end
  end
end
