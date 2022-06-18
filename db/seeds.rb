# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "a@g", password: "HogeHoge")

5.times do |n|
    EndUser.create!(
      email: "test#{n + 1}@t",
      name: "テスト太郎#{n + 1}",
      nickname: "タロちゃん#{n + 1}",
      age: 20 + n,
      height: 160 + n,
      start_weight: 47 + n,
      active_level: 0,
      objective_weight: 40  + n,
      gender: 0,
      password: "test#{n + 1}test"
    )
 end

5.times do |n|
   Relationship.create!(
     follower_id: 1 + n,
     followed_id: 5 - n
   )
end

5.times do |n|
   Food.create!(
      name: "food#{n + 1}",
      introduction: "#{n + 1}粒あたり",
      calorie:  60 + n,
      protein:  15 + n,
      carbohydrate:  10 + n,
      fat:  0.1 + n,
      fiber:  0.1 + n
   )
end

5.times do |n|
   Food.create!(
      name: "food#{n + 1}",
      introduction: "#{n + 1}粒あたり",
      calorie:  60 + n,
      protein:  15 + n,
      carbohydrate:  10 + n,
      fat:  0.1 + n,
      fiber:  0.1 + n
   )
end


