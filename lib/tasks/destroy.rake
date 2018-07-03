namespace :destroy do
  desc "Destroy all Deities"
  task deities: :environment do  
    Deity.destroy_all
    ActiveRecord::Base.connection.execute("TRUNCATE deities RESTART IDENTITY CASCADE")
  end

  desc "Destroy all Myths"
  task myths: :environment do
    Event.destroy_all
    ActiveRecord::Base.connection.execute("TRUNCATE events RESTART IDENTITY CASCADE")
  end
  
  desc "Destroy all Myths' Actors"
  task event_actors: :environment do
    EventActor.destroy_all
    ActiveRecord::Base.connection.execute("TRUNCATE event_actors RESTART IDENTITY CASCADE")
  end

  desc "Destroy all Mythologies"
  task mythologies: :environment do  
    Mythology.destroy_all
    ActiveRecord::Base.connection.execute("TRUNCATE mythologies RESTART IDENTITY CASCADE")
  end

  desc "Destroy all Births"
  task births: :environment do
    Birth.destroy_all
  end

  desc "Destroy all Domains"
  task domains: :environment do
    Domain.destroy_all
    ActiveRecord::Base.connection.execute("TRUNCATE domains RESTART IDENTITY CASCADE")
  end

  desc "Destroy all Deity Domains"
  task deity_domains: :environment do  
    DeityDomain.destroy_all
    ActiveRecord::Base.connection.execute("TRUNCATE deity_domains RESTART IDENTITY CASCADE")
    
  end
  
  task all: [:deity_domains, :domains, :event_actors, :myths, :births, :deities, :mythologies]

end