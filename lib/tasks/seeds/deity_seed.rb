# require 'csv'
# require 'json'
# require ''
# class DeitySeed
#   def self.seed
#     deities = CSV.foreach "./db/data/deities.csv", headers: true, header_converters: :symbol
#     deities.each do |row|
#       row = row.to_h
#       row[:tier] = row[:tier].to_i
#       row[:gender] = row[:gender].to_i
#       row[:mythology_id] = row[:mythology_id].to_i
#       row[:image] = "deities/#{row[:name]}.jpg"
#       puts row[:name]
#       Deity.create!(row)
#     end
#   end
# end