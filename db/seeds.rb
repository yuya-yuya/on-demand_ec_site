# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create!(
    email: "test@test",
    password: "password",
    last_name: "山田",
    first_name: "哲人",
    last_name_kana: "ヤマダ",
    first_name_kana: "テツト",
    postcode: "test",
    address: "test",
    phone_number: "test"
)

Admin.create!(
    email: "admin@admin",
    password: "password",
    password_confirmation: "password"
)