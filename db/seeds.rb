# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
arr = [0,6018501,1030026,9120805,1070061,2248520]
5.times do |i|
  i += 1
User.create(
  name: "test#{i}",
  introduction: ("test#{i}"*3),
  profile_image: File.open( "./app/assets/images/sample#{ "%02d" % i }.png", ?r ),
  email: "test#{i}@test.com",
  password: "password",
  postcode: arr[i],
  prefecture_code: "test#{i}",
  address_city: "test#{i}",
  address_street: "test#{i}",
)
Book.create(
  user_id: User.last.id,
  title: "sample#{i}",
  body: ("sample#{i}"*10)
)
end
# 101.times do |i|
#   Favorite.create(
#     user_id: 1,
#     book_id: 1
#   )
# end
