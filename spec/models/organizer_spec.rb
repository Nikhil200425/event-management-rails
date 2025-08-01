require 'rails_helper'

RSpec.describe Organizer, type: :model do
  it "is valid with valid attributes" do
    organizer = Organizer.new(email: "admin@gmail.com", password: "123456")
    expect(organizer).to be_valid
  end

  it "is invalid without email" do
    organizer = Organizer.new(password: "123456")
    expect(organizer).to_not be_valid
  end
end
