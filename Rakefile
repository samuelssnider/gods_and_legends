# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require './lib/tasks/seeds/deity_seed.rb'

namespace :seed do
  task :deities do
    DeitySeed.seed
  end
end

require_relative 'config/application'

Rails.application.load_tasks
