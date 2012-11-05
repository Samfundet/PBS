# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rake::Task['samfundet_auth_engine:db:seed'].invoke

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

puts "Creating dimensions"
number_of_dimensions = 10
number_of_dimensions.times do |dimension_number|
  dimension = Dimension.create!(
     :text => ((100 + rand * 900).to_i.to_s + "x" + (100 + rand * 900).to_i.to_s),
     :status => true
  )
  puts dimension.text
end

