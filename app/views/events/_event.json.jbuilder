json.extract! event, :id, :name, :venue, :organizer_id, :date, :ticket_price, :ticket_sold, :status, :created_at, :updated_at
json.url event_url(event, format: :json)
