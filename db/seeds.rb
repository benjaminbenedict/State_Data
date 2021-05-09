# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#1)First, Create a folder inside of lib called seeds

# Put your CSV file example.csv into the lib/seeds folder. In the example below, the file is called real_estate_transactions.csv

# Make sure you've created a resource with the appropriate columns to match your seed data. The names don't have to match up.

require "csv"

csv_text = File.read(Rails.root.join("lib", "seeds", "state_data.csv"))
puts csv_text
#2) The first line requires the Ruby CSV library we need to properly parse the CSV data. The next line reads in the CSV file into a variable. The last line prints the contents of the variable. When you run rake db:seed you should see a wall of text representing your CSV data. It's a first step, but we've still got a lot of work to do.

#   We'll keep building off this code until we've created a working seeds file. You should be able to run rake db:seed at the end of each step
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
puts csv
#3) The new line converts the CSV file into a structure that Ruby can read. The :headers => true option tells the parser to ignore the first line of the CSV file.
csv.each do |row|
  puts row.to_hash
end
#4) This new addition loops through the entire CSV file and converts each row of the document into a hash. The headers of the CSV file will be used as keys for the hash because we added the :headers => true option in our previous step.
csv.each do |row|
  s = State.new
  s.name = row["state"]
  s.median_household_income = row["median_household_income"]
  s.share_unemployed_seasonal = row["share_unemployed_seasonal"]
  s.share_population_in_metro_areas = row["share_population_in_metro_areas"]
  s.share_population_with_high_school_degree = row["share_population_with_high_school_degree"]
  # s.abbrev = row["abbrev"]
  # s.code = row["code"]
  s.save
  puts "#{s.name} saved"
end

puts "there are now #{State.count} rows in the State table"

# now the abbreviations
#Peter Jang Master coder method
# Read the file
csv_text2 = File.read("lib/seeds/abbreviations.csv")

# Remove the weird invisible whitespace character on the first line
csv_text2 = csv_text2.gsub(csv_text2[0], "")

# Remove all quotes
csv_text2 = csv_text2.gsub("\"", "")

# Parse the text as a csv
csv = CSV.parse(csv_text2, :headers => true)
csv.each do |row|
  # p row["State"]
  # p row["Abbrev"]
  # p row["Code"]
  s = State.find_by(name: row["State"])
  # p s
  s.abbrev = row["Abbrev"]
  s.code = row["Code"]
  s.save
  p s
  puts "#{s.name} saved"
end

# quote_chars = %w(" | ~ ^ & *)
# begin
#   csv_text2 = File.read(Rails.root.join("lib", "seeds", "abbreviations.csv"), headers: :first_row, quote_char: quote_chars.shift)
# rescue CSV::MalformedCSVError
#   quote_chars.empty? ? raise : retry
# end

# csv2 = CSV.parse(csv_text2, :headers => true, col_sep: "\t", quote_char: "\x00", :encoding => "ISO-8859-1")
# puts csv2

# csv2.each do |row|
#   p row
# end

# CSV.open(("lib/seeds/abbreviations.csv"), col_sep: "\t", quote_char: "\x00", headers: true).each do |row|
#   s = State.find_by(name: row["State"])
#   p row
#   p s
# s.abbrev = row["Abbrev"]
# s.code = row["Code"]
# s.save
# puts "#{s.name} saved"
# end

# puts csv_text2

# quoted_csv_text2 = File.read(Rails.root.join("lib", "seeds", "abbreviations.csv"))

# unquoted_csv2 = quoted_csv_text2.gsub("\0", "")

# csv2 = CSV.parse("lib/seeds/abbreviations.csv", :col_sep => "\t", :quote_char => "\x00", headers: true)
# do |row|
# s = State.find_by(name: row["State"])
# s.abbrev = row["Abbrev"]
# s.code = row["Code"]
# s.save
# puts "#{s.name} saved"

# end

# csv2.each do |row|
#   puts row.to_hash
# end

# csv2.each do |row|
# p row["state"]
# s = State.find_by(name: row["state"])
# p s
# s.abbrev = row["Abbrev"]
# s.code = row["Code"]
# s.save
# puts "#{s.name} saved"
# end
