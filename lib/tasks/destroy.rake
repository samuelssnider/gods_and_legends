namespace :destroy do
  desc "Destroy all Deities"
  task deities: :environment do

  desc "Destroy all Myths"
  task myths: :environment do

  desc "Destroy all Mythologies"
  task mythologies: :environment {Mytholo}

  desc "Destroy all Births"
  task births: :environment {Birth.destroy_all}

  desc "Destroy all Domains"
  task domains: :environment {Domain.destroy_all}

  desc "Destroy all Deity Domains"
  task deity_domains: :environment {DeityDomain.destroy_all}

end
