# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

Product.create!(name: 'Apples')
Product.create!(name: 'Oranges')
Product.create!(name: 'Strawberries')
Product.create!(name: 'Bananas')
Product.create!(name: 'Blueberries')
Product.create!(name: 'Pears')
Product.create!(name: 'Grapes')