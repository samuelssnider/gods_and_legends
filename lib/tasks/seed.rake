require 'csv'
require 'json'

namespace :seed do
  desc "Seed all deities (mythologies must be seeded to complete this task)"
  task deities: :environment do
    deities = CSV.foreach "./db/data/deities.csv", headers: true, header_converters: :symbol
    deities.each do |row|
      row = row.to_h
      row[:tier] = row[:tier].to_i
      row[:gender] = row[:gender].to_i
      row[:mythology_id] = row[:mythology_id].to_i
      row[:image] = "deities/#{row[:name]}.jpg"
      puts row[:name]
      Deity.create!(row)
    end
  end

  desc "TODO"
  task myths: :environment do
    events = JSON.parse(File.read("./db/data/events.json"), symbolize_names: true)
    events.each do |event|
      event = event.to_h
      puts event[:eventTitle]
      Event.create!(title:       event[:eventTitle],
                   description: event[:eventDescription],
                   deities:     event[:eventActors].map {|actor| Deity.find_by(name: actor[:name])},
                   mythology_id:   event[:mythology_id]
                  )
    end
  end

  desc "TODO"
  task mythologies: :environment do
    greek = "The greeks did not believe that the Gods Created the universe; they believed that the Universe and more specifically the Chaos that was pre-eminent Chaos that existed within it was responsible for creating Gaia (the earth). From Gaia came Uranus, the personification of the Sky. Together (Sky and Earth) Gaia and Uranus bore the twelve titans, six male and six female, that reigned for untold eons. Along with the Titans, the union of Gaia and Uranus bore also the Cyclopes and Hecantonchires; both were beings of immense power and cruelty, but the powerful Titans were enable to imprison them. The leader of the Titans was Cronus, who learned by Gaia and Uranus the prophecy that his own children would one day overthrow him. Seeking to avoid this prophecy, Cronus swallowed each of his children as soon as they were born. The mother of these babes and consort to Cronus was the Titaness Rhea, who deceived Cronus by substituting a rock swaddled like a babe for her sixth child, Zeus. Rhea hid Zeus with the nymph Adamanthea, who dangled Zeus from a tree branch as to keep him suspended between Earth, Sky, and Sea, all domains which Cronus had rule over. When Zeus had grown up, he tricked Cronus into drinking a vomit inducing potion, that freed his siblings. Once free, the new Gods entered a vast war with the current rulers of the world the Titans. This was known as the Titanomachy. Zeus with the help of his brothers and sisters, as well as the Cyclopes and Hecatonchires, conquered the Titans and made their home on Olympus. This Heavenly fortress is the seat of Zeus, King of the Gods, and his fellow Olympians to this day."

    norse = "In the beginning there was only the silent, dark abyss: Ginnungagap. The abyss lay between the land of elemental fire, Muspelheim, and the land of elemental ice, Nifheim. The proximity of these two volitile lands gave way to a steamy mist, which refroze in the abyss to become Ymir, first of the giants. Ymir was hermaphriditic and could thus reproduce a-sexually. From his sweat, more giants were born. Audhumbla, a cow was the next to emerge from Ymir's perspiration. She licked Ymir and revealed Buri, first of what would become know as the Æsir, or principal pantheon of the Norse. Buri has a son Bor, who married Bestla (who desended from the giant Bolthorn). The half-god, half-giant sons of Bor and Bestla Odin, Vili, and Ve. Odin was frightened that the giants were always producing more giants by sweating. Fearful that they would become impossibly outnumbered, Odin and his two brothers slew Ymir and constructed the world from his corpse. The bloodshed from destroying Ymir lef the giants all but extinct, leaving just the Bergelmir and his wife living. The Oceans and Rivers came from his blood, the soil from his skin and muscles, the flora from his hair. His brains formed the clouds, and his skull the sky- which was held aloft by four dwarves. His eyelashes became Midgard, the eventual home of humans. The Gods formed the humans, Ask and Embla, from two tree trunks, and build a fence around their realm, Midgard, to protect them from giants. A man nameed Mundilfari had two beautiful children; his son he named Mani, 'Moon', his daughter Sol, 'Sun'. The Gods were enraged by this, and put the in the sky, and each ride in a chariot in the sky."

    egyptian = "The world was borne from the infinite lifeless sea, summoned forth my the first rising of the sun. Atum, who created himself, evolved from a single being into multiple elements. Atum gave rise to Shu and Tefnut, the air gods who in turn birthed Geb the earth god and Nut the sky goddess. Together, Geb and Nut defined the limits of the world. Geb and Nut gave birth to four children who represent the forces of life: Osiris, god of fertility and regeneration; Isis, goddess of Motherhood; Set, the god of chaos; and Nephthys, the goddesss of chaos. These nine god came to be known as the Ennead."

    Mythology.create(name: "Greek", origin_story: greek, image: "mythologies/Greek.jpg")
    Mythology.create(name: "Norse", origin_story: norse, image: "mythologies/Norse.jpg")
    Mythology.create(name: "Egyptian", origin_story: egyptian, image: "mythologies/Egyptian.jpg")
    Mythology.all {|mythology| puts mythology.name }
  end

  desc "Seed Domains"
  task domains: :environment do
    domains = CSV.foreach "./db/data/domains.csv", headers: true, header_converters: :symbol
    domains.each do |domain|
      domain = domain.to_h
      puts domain[:name]
      Domain.create!(name: domain[:name])
    end
  end

  desc "Seed each deity's domains"
  task deity_domains: :environment do
    deity_domains = CSV.foreach "./db/data/deity_domains.csv", headers: true, header_converters: :symbol
    deity_domains.each do |deity_domain|
      puts "#{deity_domain[:deity]} --> #{deity_domain[:domain]}"
      deity_domain = deity_domain.to_h
      DeityDomain.create!(deity: Deity.find_by(name: deity_domain[:deity]), domain: Domain.find_by(name: deity_domain[:domain]))
    end
  end

  desc "Seed all Births"
  task births: :environment do
    births = CSV.foreach "./db/data/begetting.csv", headers: true, header_converters: :symbol
    births.each do |birth|
      birth = birth.to_h
      puts "#{birth[:parent]} --> #{birth[:child]}"
      parent = Deity.find_by(name: birth[:parent])
      child = Deity.find_by(name: birth[:child])
      Birth.create!(parent: parent, child: child)
    end
  end

end
