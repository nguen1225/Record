json.array! @events, partial: "users/events/event", as: :event

json.array!(@events) do |event|
  json.extract! event, :id, :title, :text
  json.start event.start_date
  json.end event.end_date
  json.url event_url(event)
end