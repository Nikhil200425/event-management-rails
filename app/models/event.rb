class Event < ApplicationRecord
  belongs_to :organizer
  validates :name, :date, :venue, :ticket_price, :venue_capacity, :date, presence: true
  has_many :tickets, dependent: :destroy
  validate :no_overlapping_events

  def ticket_sold
    tickets.count
  end

  def editable?
    ticket_sold == 0
  end

  private

  def no_overlapping_events
    overlap = Event.where(venue: venue).where.not(id: id).where(date: date.beginning_of_hour..date.end_of_hour)
    errors.add(:base, "Event overlaps") if overlap.exists?
  end
end
