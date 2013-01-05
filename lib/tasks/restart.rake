namespace :db do
  desc "Resets the DB and prepares both for development and testing"
  task :restart => [:environment, :drop, :create, :migrate, :populate, :populate_sample_data] do
  end
end
