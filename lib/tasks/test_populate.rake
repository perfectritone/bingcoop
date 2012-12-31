namespace :db do
  namespace :test do
    desc "Loads initial database models for the test environment."
    task :populate => :environment do
      ActiveRecord::Base.establish_connection('test')
      Dir[File.join(Rails.root, 'db', 'fixtures', '*.rb')].sort.each { |fixture| load fixture }
      Dir[File.join(Rails.root, 'db', 'fixtures', Rails.env, '*.rb')].sort.each { |fixture| load fixture }
    end
  end
end
