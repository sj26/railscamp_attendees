require 'csv'

attendees = CSV.read('rcx.csv', headers: true)

CSV.open('rcx.csv', 'wb') do |csv|
  csv << ['First Name', 'Last Name', 'Twitter Handle']

  attendees.each do |attendee|
    attendee['Twitter Handle'].gsub!(/^@?/, '@') if attendee['Twitter Handle']
    csv << attendee.fields.map { |f| f.strip if f.respond_to?(:strip) }
  end
end
