# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create(email: "test1@test1", last_name: "test1last", read_last_name: "テスト１姓", first_name: "test1name", read_first_name: "テスト１名", phone_number: "testphonenumber", post_code: "test_post_code", prefecture: "test_prefecture", city: "test-city", street: "test-street", password: "testtest")