json.array! @time_slots do |slot|
  json.extract! slot, :id, :start_time, :end_time, :activity_id, :booked
end
