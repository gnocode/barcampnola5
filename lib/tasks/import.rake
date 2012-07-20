require 'csv'

task :import => :environment do
  csv = CSV.parse File.read Rails.root.join 'barcamp.csv'

  csv.shift

  entries = csv.map do |row|
    {
      :title => (row[0].gsub(/\s+/,' ') if row[0]),
      :body => (row[1].gsub(/\s+/,' ') if row[1]),
      :start_at => row[2],
      :end_at => row[3],
      :tag_names => row[4],
      :media => row[5],
      :uri => row[6]
    }
  end

  entries.each do |entry|
    uri = ENV["IMPORT_URI"] || "nolavation-de-production.herokuapp.com"
    path = '/entries.json'
    body = { :entry => entry }.to_json
    header = { "Content-Type" => "application/json" }

    http = Net::HTTP.new(uri, ENV["IMPORT_PORT"])
    http.post path, body, header
  end
end

