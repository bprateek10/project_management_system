# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


project_manager = ProjectManager.new( first_name: "test",
  last_name: "manager",
  email: "manager@yopmail.com",
  password: "pass1234"
)

puts "Project Manager Created" if project_manager.save