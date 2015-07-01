desc "This task is called using cron or Heroku scheduler add-on"

task :weather => :environment do
  Weather.write
  puts Weather.read
end
