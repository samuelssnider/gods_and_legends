RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  
  config.before(:suite) do
    begin
      DatabaseCleaner[:active_record].strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end