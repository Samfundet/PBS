# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

number_of_members = 50
number_of_members.times do |member_number|
  member = Member.create!(
      :firstname => "Bolle",
      :surname => "Bolla",
      :phone => (10000000 + rand * 9000000).to_i.to_s,
      :email => "bolle@bolla.com",
      :password => 'passord',
  )
end

number_of_dimensions = 10
number_of_dimensions.times do |dimension_number|
  dimension = Dimension.create!(
     :text => ((100 + rand * 900).to_i.to_s + "x" + (100 + rand * 900).to_i.to_s)
  )
end

