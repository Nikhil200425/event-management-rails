require "csv"

class EventsController < ApplicationController
  before_action :authenticate_organizer!
  before_action :set_event, only: %i[ show edit update destroy download_attendees]
  before_action :check_editable, only: %i[edit update destroy]

  # GET /events or /events.json
  def index
    @events = current_organizer.events.includes(:tickets)
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = current_organizer.events.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = current_organizer.events.build(event_params)
      if @event.save
       redirect_to @event, notice: "Event was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
      @event.destroy
      redirect_to events_path, notice: "Successfully deleted"
  end

  def download_attendees
    attendees = @event.tickets
    csv_data = CSV.generate(headers: true) do |csv|
      csv << [ "Email" ]
      attendees.each { |t| csv << [ t.attendee_email ] }
    end
    send_data csv_data, filename: "#{@event.id}.csv"
  end

  private
    def set_event
      @event = Event.find(params.expect(:id))
    end

    def check_editable
      unless @event.editable?
        redirect_to events_path, notice: "Cannot modify and deleted"
      end
    end

    def event_params
      params.require(:event).permit(:name, :venue, :date, :venue_capacity, :ticket_price, :ticket_sold, :status)
    end
end
