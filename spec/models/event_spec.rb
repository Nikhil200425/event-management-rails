require 'rails_helper'
RSpec.describe Event, type: :model do
  let(:organizer) { Organizer.create!(email: "admin@gmail.com", password: "123456") }
  it "is valid with valid attributes" do
    event = Event.new(name: "IPL", venue: "D.Y.Patil", date: Date.today, venue_capacity: 200, ticket_price: 20000, ticket_sold: 0, organizer: organizer)
    expect(event).to be_valid
  end
  it "is invalid without a name" do
    event = Event.new(venue: "D.Y.Patil", date: Date.today, venue_capacity: 200, ticket_price: 20000, ticket_sold: 0, organizer: organizer)
    expect(event).not_to be_valid
  end

  it "is invalid without a venue" do
    event = Event.new(name: "IPL", date: Date.today, venue_capacity: 200, ticket_price: 20000, ticket_sold: 0, organizer: organizer)
    expect(event).not_to be_valid
  end
  it "is invalid without a venue capacity" do
    event = Event.new(name: "IPL", venue: "D.Y.Patil", date: Date.today, ticket_price: 20000, ticket_sold: 0, organizer: organizer)
    expect(event).not_to be_valid
  end
  it "is invalid without a ticket price" do
    event = Event.new(name: "IPL", venue: "D.Y.Patil", date: Date.today, venue_capacity: 200, ticket_sold: 0, organizer: organizer)
    expect(event).not_to be_valid
  end
end
