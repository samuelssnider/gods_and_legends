require 'csv'

deities = CSV.foreach "./db/data/deities.csv", headers: true, header_converters: :symbol
births = CSV.foreach "./db/data/begetting.csv", headers: true, header_converters: :symbol

greek_file = Rails.root.join('/db/data/greek.text')
text = open(greek_file)
Mythology.create(name: "Greek", origin_story: text.read)
text.close

deities.each do |row|
  row = row.to_h
  row[:tier] = row[:tier].to_i
  row[:gender] = row[:gender].to_i
  row[:mythology_id] = row[:mythology_id].to_i
  Deity.create!(row)
end

births.each do |row|
  row = row.to_h
  Birth.create!(row)
end