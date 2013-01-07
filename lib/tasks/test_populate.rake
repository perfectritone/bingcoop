namespace :db do
  namespace :test do
    desc "Loads initial database models for the test environment."
    task :prepare => :environment do
      Dir[File.join(Rails.root, 'db', 'fixtures', '*.rb')].sort.each { |fixture| load fixture }
      Dir[File.join(Rails.root, 'db', 'fixtures', Rails.env, '*.rb')].sort.each { |fixture| load fixture }
    end
  end
end
