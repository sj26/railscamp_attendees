require 'csv'

attendees = CSV.read('rcx.csv', headers: true).sort { |x, y| x['First'] <=> y['First'] }

CSV.open('rcx.csv', 'wb') do |csv|
  csv << ['First', 'Last', 'Twitter']

  attendees.each do |attendee|
    attendee['Twitter'].gsub!(/^@?/, '@') if attendee['Twitter']
    csv << attendee.fields.map { |f| f.strip if f.respond_to?(:strip) }
  end
end
