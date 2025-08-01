require 'rails_helper'
RSpec.describe Event, type: :model do
  let(:organizer) { Organizer.create!(email: "admin@gmail.com", password: "123456") }
  let(:event) { Event.create!(name: "IPL", venue: "D.Y.Patil", date: Date.today, venue_capacity: 200, ticket_price: 20000, ticket_sold: 0, organizer: organizer) }
  it "is valid with valid attributes" do
    ticket = Ticket.new(event: event, attendee_email: "a@gmail.com")
    expect(ticket).to be_valid
  end
  it "is invalid without a email" do
    ticket = Ticket.new(event: event)
    expect(ticket).not_to be_valid
  end
end
