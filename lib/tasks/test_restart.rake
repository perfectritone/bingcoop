namespace :db do
  namespace :test do
    desc "Resets the DB and prepares both for development and testing"
    task :restart => [:environment, :prepare, :populate] do
    end
  end
end
