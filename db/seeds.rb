# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rake::Task['samfundet_auth_engine:db:seed'].invoke

Member.create!(:mail=>'test1@test.com', :fornavn=>'test1', :passord=>'passord')
Member.create!(:mail=>'test2@test.com', :fornavn=>'test2', :passord=>'passord')
m = Member.create!(:mail=>'test3@test.com', :fornavn=>'test3', :passord=>'passord')

m.roles << Role.create!(:name => "mg_layout_sjef", :description => "Sjef i layout", :title => "mg_layout")

julaften = Event.create!(
    :name => "Julaften",
    :time => Time.new(2012,12,24,00,00)
)

halloween = Event.create!(
    :name => "halloween",
    :time => Time.new(2012,10,31)
)

Nightwish = Event.create!(
    :name => "nightwish",
    :time => Time.new(2012,11,9)
)

meshuggah = Event.create!(
    :name => "meshuggah",
    :time => Time.new(2012,11,19)
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

