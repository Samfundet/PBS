# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

julaften = Event.create!(
    :name => "Julaften",
    :time => DateTime.new(2012,12,24)
)

halloween = Event.create!(
    :name => "halloween",
    :time => DateTime.new(2012,10,31)
)

Nightwish = Event.create!(
    :name => "nightwish",
    :time => DateTime.new(2012,11,9)
)

meshuggah = Event.create!(
    :name => "meshuggah",
    :time => DateTime.new(2012,11,19)
)

layout = Group.create!(
  :name => "Layout"
)
ksg = Group.create!(
  :name => "KSG"
)
ark = Group.create!(
  :name => "ARK"
)
mg = Group.create!(
  :name => "MG"
)
regi = Group.create!(
  :name => "Regi"
)
fg = Group.create!(
  :name => "FG"
)
sit = Group.create!(
  :name => "SIT"
)

groups = [ksg, ark, mg, regi, fg, sit]

member = Member.create!(
    :firstname => "Sondre",
    :surname => "Basma",
    :phone => (10000000 + rand * 9000000).to_i.to_s,
    :email => "sondre1504@gmail.com",
    :password => 'passord',
    :groups => [layout, ark],
)

member = Member.create!(
    :firstname => "Morten",
    :surname => "Lysgaard",
    :phone => (10000000 + rand * 9000000).to_i.to_s,
    :email => "mlysgaard@gmail.com",
    :password => 'passord',
    :groups => [layout, ksg],
)

member = Member.create!(
    :firstname => "Rune",
    :surname => "Holmgren",
    :phone => (10000000 + rand * 9000000).to_i.to_s,
    :email => "raane.holm@gmail.com",
    :password => 'passord',
    :groups => [layout, regi],
)
number_of_members = 50
prng = Random.new
puts "Creating members"
number_of_members.times do |member_number|
  member = Member.create!(
      :firstname => Faker::Name.first_name,
      :surname => Faker::Name.last_name,
      :phone => (10000000 + rand * 9000000).to_i.to_s,
      :email => Faker::Internet.free_email,
      :password => 'passord',
      :groups => groups.sample(prng.rand(1..3)),
  )
  puts member.firstname + " " + member.surname + " " + member.id.to_i.to_s
end

puts "Creating dimensions"
number_of_dimensions = 10
number_of_dimensions.times do |dimension_number|
  dimension = Dimension.create!(
     :text => ((100 + rand * 900).to_i.to_s + "x" + (100 + rand * 900).to_i.to_s),
     :status => true
  )
  puts dimension.text
end

