require 'faker'

# Create 2 users
user1 = User.new(
  name: 'Peter Built',
  email: 'user1@fake.com',
  password: 'password'
)
user1.skip_confirmation!
user1.save

user2 = User.new(
  name: 'Joey B',
  email: 'joe.buczek@gmail.com',
  password: 'password'
)
user2.skip_confirmation!
user2.save

# Create 2 lists, one for each user
users = User.all

users.each do |user|
  list = List.create!(
    user: user,
    title: Faker::Lorem.sentence
  )
end

# Create items
lists = List.all # create lists to sample from for items

10.times do
  item = Item.create!(
    name: Faker::Lorem.sentence,
    list: lists.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"