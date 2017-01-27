# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Plan.create!(title: "Example", stripe_id: "example", price: 0.0, bootstrap: "warning", public: true)
Plan.create!(title: "Something", stripe_id: "something", price: 5.0, bootstrap: "success", public: true)
Plan.create!(title: "Other", stripe_id: "other", price: 15.0, bootstrap: "danger", public: true)
