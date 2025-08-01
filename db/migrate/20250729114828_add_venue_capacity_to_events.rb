class AddVenueCapacityToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :venue_capacity, :integer
  end
end
