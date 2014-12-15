task import: :environment do
  require 'csv'

  csv_text = File.read('tmp/pitch.csv')

  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    #sleep(2.second)
    f = FieldAddress.create(name: row[0].strip, borough: row[1].strip, address: row[2].strip)
    if f.latitude.nil? || f.longitude.nil?
      puts "Couldn't find for #{row[0]}"
    end
  end
end
