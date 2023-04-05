# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Employee.destroy_all

Employee.create!(first_name: "Avi", last_name: "Bhurtel", username: "avi", email: "avi@avi.com", password: "foobarfoobar", password_confirmation: "foobarfoobar")

8.times do
  attrs = {first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
           password: "foobarfoobar", password_confirmation: "foobarfoobar"}
  Employee.create!(attrs.merge(Faker::Internet.unique.user))
end
