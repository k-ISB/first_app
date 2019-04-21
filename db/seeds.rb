# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "master",
             email: "k-isb@firsdtapp.org",
             password:              "fight00W",
             password_confirmation: "fight00W",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

3.times do |n|
  case n
  when 0
    name  = "たつき"
  when 1
    name  = "manaka"
  else
    name  = "しおり"
  end
  email = "number-#{n+1}@firstapp.org"
  password = "passworker"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end