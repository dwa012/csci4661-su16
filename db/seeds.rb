# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(admin moderator guest).each do |role|
  Role.where(name: role).first_or_create
end

[
    { email: 'test@example.com', name: 'test1', password: 'test', password_confirmation: 'test' },
    { email: 'test2@example.com', name: 'test2', password: 'test', password_confirmation: 'test' },
].each do |user_attributes|
  puts "Creating user: #{user_attributes[:email]}"
  User.where(email: user_attributes[:email]).first_or_create!(user_attributes)
end

[
    { user: User.where(email: 'test@example.com').first, role: Role.where(name: 'admin').first },
].each do |user_attributes|
  puts "Adding role: #{user_attributes[:role].name} to user: #{user_attributes[:user].email}"
  UserRole.where(user: user_attributes[:user], role: user_attributes[:role]).first_or_create!
end