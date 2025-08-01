class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :venue
      t.references :organizer, null: false, foreign_key: true
      t.datetime :date
      t.integer :venue_capacity
      t.decimal :ticket_price
      t.integer :ticket_sold
      t.string :status

      t.timestamps
    end
  end
end
