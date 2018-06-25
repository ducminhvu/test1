desc "This task is called by the Heroku scheduler add-on"

task app1_generate_seed: :environment do
  puts "App1: Generating Seed.."
  Seed.create label_prefix: "1", app_id: 1
  puts "done."
end

task app2_generate_seed: :environment do
  puts "App2: Generating Seed.."
  Seed.create label_prefix: "2", app_id: 2
  puts "done."
end

task app1_create_fruit: :environment do
  puts "App1: Create new fruit.."
  Fruit.create name_prefix: "f", seed: Seed.not_consumed_by_app_id(1).first
  puts "done."
end

task app2_create_fruit: :environment do
  puts "App2: Create new fruit.."
  Fruit.create name_prefix: "j", seed: Seed.not_consumed_by_app_id(2).first
  puts "done."
end
