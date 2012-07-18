require 'csv'

csv = CSV.parse File.read 'barcamp.csv'

csv.shift

entries = csv.map do |row|
  {
    :title => (row[0].gsub(/\s+/,' ') if row[0]),
    :body => (row[1].gsub(/\s+/,' ') if row[1]),
    :start_at => row[2],
    :end_at => row[3],
    :tags => row[4],
    :media => row[5],
    :uri => row[6]
  }
end

entries.each do |entry|
  puts "entries << Entry.new(#{entry.inspect.gsub('tags', 'tag_names').gsub(/\{|\}/,'')})"
end
