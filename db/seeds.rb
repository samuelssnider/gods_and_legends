require 'csv'

deities = CSV.foreach "./db/data/deities.csv", headers: true, header_converters: :symbol
births = CSV.foreach "./db/data/begetting.csv", headers: true, header_converters: :symbol


greek = "The greeks did not believe that the Gods Created the universe; they believed that the Universe and more specifically the Chaos that was pre-eminent Chaos that existed within it was responsible for creating Gaia (the earth). From Gaia came Uranus, the personification of the Sky. Together (Sky and Earth) Gaia and Uranus bore the twelve titans, six male and six female, that reigned for untold eons. Along with the Titans, the union of Gaia and Uranus bore also the Cyclopes and Hecantonchires; both were beings of immense power and cruelty, but the powerful Titans were enable to imprison them. The leader of the Titans was Cronus, who learned by Gaia and Uranus the prophecy that his own children would one day overthrow him. Seeking to avoid this prophecy, Cronus swallowed each of his children as soon as they were born. The mother of these babes and consort to Cronus was the Titaness Rhea, who deceived Cronus by substituting a rock swaddled like a babe for her sixth child, Zeus. Rhea hid Zeus with the nymph Adamanthea, who dangled Zeus from a tree branch as to keep him suspended between Earth, Sky, and Sea, all domains which Cronus had rule over. When Zeus had grown up, he tricked Cronus into drinking a vomit inducing potion, that freed his siblings. Once free, the new Gods entered a vast war with the current rulers of the world the Titans. This was known as the Titanomachy. Zeus with the help of his brothers and sisters, as well as the Cyclopes and Hecatonchires, conquered the Titans and made their home on Olympus. This Heavenly fortress is the seat of Zeus, King of the Gods, and his fellow Olympians to this day."

Mythology.create(name: "Greek", origin_story: greek)


deities.each do |row|
  row = row.to_h
  row[:tier] = row[:tier].to_i
  row[:gender] = row[:gender].to_i
  row[:mythology_id] = row[:mythology_id].to_i
  Deity.create!(row)
end

births.each do |birth|
  birth = birth.to_h
  parent = Deity.find_by(name: birth[:parent])
  child = Deity.find_by(name: birth[:child])
  Birth.create!(parent: parent, child: child)
end


