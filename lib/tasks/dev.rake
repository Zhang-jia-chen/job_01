namespace :dev do
  task :fake => :environment do
    User.delete_all
    users = []
    users << User.create!( :email => "admin@admin.org", :password => "12345678" )
    20.times do |i|
      users << User.create!( :email => Faker::Internet.email, :password => "12345678")
      puts "Generate User #{i}"
    end

    50.times do |i|
      puts "Generate Job #{i}"
        Job.create(
        title: Faker::Cat.name,
        description: Faker::Lorem.word,
        wage_upper_bound: Faker::Number.number(5)
        wage_lower_bound: Faker::Number.number(2000, 100000)
        
        )
    end
  end
end

namespace :dev do

  task :fake => :environment do
    User.delete_all
    Event.delete_all

    users = []
    users << User.create!( :email => "admin@example.org", :password => "12345678" )

    10.times do |i|
      users << User.create!( :email => Faker::Internet.email, :password => "12345678")
      puts "Generate User #{i}"
    end

    20.times do |i|
      topic = Event.create!( :name => Faker::Cat.name,
                             :description => Faker::Lorem.paragraph,
                             :user_id => users.sample.id )
      puts "Generate Event #{i}"
    end
  end

end
