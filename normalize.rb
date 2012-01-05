require 'csv'

attendees = CSV.read('rcx.csv', headers: true)

CSV.open('rcx.csv', 'wb') do |csv|
  csv << ['First', 'Last', 'Twitter']

  attendees.sort { |x, y| x['First'] <=> y['First'] }.each do |attendee|
    attendee['Twitter'].gsub!(/^@?/, '@') if attendee['Twitter']
    csv << attendee.fields.map { |f| f.strip if f.respond_to?(:strip) }
  end
end
