# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[:admin, :user].each do |role|
<<<<<<< HEAD
  Role.find_or_create_by(name: role, without_protection: true)
=======
  Role.find_or_create_by_name({ name: role }, without_protection: true)
>>>>>>> 400f1a416d286e3dc2720400d5049cbf0d7b34ac
end